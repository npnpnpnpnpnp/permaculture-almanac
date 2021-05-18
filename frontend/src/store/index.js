import Vue from 'vue'
import Vuex from 'vuex'
import EventBus from '@/event-bus'
import ApiService from '@/services/api'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    availableLanguages: [],
    availableLanguagesFallback:
      process.env.VUE_APP_AVAILABLE_LANGUAGES_FALLBACK,
    currentLanguage: process.env.VUE_APP_I18N_LOCALE,
    initialized: false,
    metaDescription: undefined,
    routes: [],
    siteTitle: undefined
  },

  mutations: {
    set(state, data) {
      Object.entries(data).forEach(([key, value]) => {
        state[key] = value
      })
    },
    setLanguage(state, payload) {
      state.currentLanguage = payload
      // localStorage.lang = payload
      // i18n.locale = payload
    }
  },

  actions: {
    async getDefaults({ commit }) {
      const { data } = await ApiService.get('defaults')
      commit('set', data)
      commit('set', { initialized: true })
    },
    async setLanguage({ dispatch, commit }, payload) {
      commit('setLanguage', payload)
      await dispatch('getDefaults')
      EventBus.$emit('set-language')
    }
  }
})
