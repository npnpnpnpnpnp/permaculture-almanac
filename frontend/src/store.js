import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import { addRoutesFromApi } from '@/router'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    initialized: false,
    routes: [],
    pageTitle: undefined,
    metaDescription: undefined
  },

  mutations: {
    set(state, data) {
      Object.entries(data).forEach(([key, value]) => {
        state[key] = value
      })
    }
  },

  actions: {
    async getDefaults({ commit }) {
      const { data } = await axios.get('defaults')
      commit('set', data)
      commit('set', { initialized: true })

      addRoutesFromApi(data.routes)
    }
  }
})
