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
    siteTitle: undefined,
    breakpoints: {
      medium: window.matchMedia('(min-width: 48em)'),
      large: window.matchMedia('(min-width: 64em)')
    },
    isDesktop: false,
    isLarge: false
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
    },
    updateBreakpoints(state) {
      // Use this function to test if a certain breakpoint matches and to define what should happen next
      state.isDesktop = state.breakpoints.medium.matches
      state.isLarge = state.breakpoints.large.matches
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
    },
    // Set up handlers for all defined breakpoints
    initBreakpoints({ commit, state }) {
      Object.keys(state.breakpoints).forEach(key => {
        // Check breakpoint initially
        // commit('updateBreakpoints', state.breakpoints[key])
        commit('updateBreakpoints')
        // Add event listener to breakpoint
        state.breakpoints[key].addListener(() => {
          commit('updateBreakpoints')
        })
      })
    }
  }
})
