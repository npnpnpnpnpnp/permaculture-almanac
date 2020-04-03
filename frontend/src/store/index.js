import Vue from 'vue'
import Vuex from 'vuex'
import { addRoutesFromApi } from '@/router'
import EventBus from '@/event-bus'
import ApiService from '@/services/api'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    apiRoutes: [],
    availableLanguages: [],
    availableLanguagesFallback:
      process.env.VUE_APP_AVAILABLE_LANGUAGES_FALLBACK,
    currentLanguage: process.env.VUE_APP_I18N_LOCALE,
    initialized: false,
    metaDescription: undefined,
    siteTitle: undefined
  },

  mutations: {
    set(state, data) {
      Object.entries(data).forEach(([key, value]) => {
        state[key] = value
      })
    },
    setLanguage(state, payload) {
      state.currentLanguage = localStorage.lang = payload.lang
      EventBus.$emit('language-change')
    },
    recallLanguage(state, payload) {
      const languages = state.availableLanguagesFallback.split(',')
      const segmentsRaw = payload.to.fullPath.split('/')
      const segments = segmentsRaw.filter(segment => segment != '')
      const urlLang = segments[0]

      if (languages.includes(urlLang)) {
        state.currentLanguage = urlLang
        // i18n.locale = urlLang
        document.documentElement.setAttribute('lang', urlLang)
      }
    }
  },

  actions: {
    async getDefaults({ commit, state }, payload) {
      commit('recallLanguage', payload)
      const { data } = await ApiService.get('defaults/' + state.currentLanguage)
      commit('set', data)
      commit('set', { initialized: true })

      addRoutesFromApi(data.apiRoutes)
    }
  }
})
