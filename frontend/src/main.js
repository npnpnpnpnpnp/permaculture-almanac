import Vue from 'vue'
import App from '@/app.vue'
import router from '@/router'
import store from '@/store'
import ApiService from '@/services/api'
import SmartTable from 'vuejs-smart-table'
import PortalVue from 'portal-vue'
import VueFormulate from '@braid/vue-formulate'

Vue.use(VueFormulate)
Vue.use(PortalVue)
Vue.use(SmartTable)

Vue.config.productionTip = false

ApiService.init(process.env.VUE_APP_API_URL)

const main = new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

export default main
