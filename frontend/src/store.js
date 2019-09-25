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
      state.currentLanguage = localStorage.lang = payload.currentLanguage.name
      EventBus.$emit('language-change')
    },
    recallLanguage(state) {
      if (localStorage.lang) {
        state.currentLanguage = localStorage.lang
        document.documentElement.setAttribute('lang', localStorage.lang)
      }
    }
  },

  actions: {
    async getDefaults({ commit, state }) {
      commit('recallLanguage')
      const { data } = await ApiService.get('defaults/' + state.currentLanguage)
      commit('set', data)
      commit('set', { initialized: true })

      addRoutesFromApi(data.apiRoutes)
    }
  }
})
