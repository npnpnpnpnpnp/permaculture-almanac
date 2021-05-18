import Vue from 'vue'
import App from '@/app.vue'
import router from '@/router'
import store from '@/store'
import ApiService from '@/services/api'

Vue.config.productionTip = false

ApiService.init(process.env.VUE_APP_API_URL)

const main = new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

export default main
