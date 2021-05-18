// Based on https://medium.com/@zitko/structuring-a-vue-project-authentication-87032e5bfe16
import axios from 'axios'
import store from '@/store'

const ApiService = {
  init(baseURL) {
    axios.defaults.baseURL = baseURL
  },

  setHeader() {
    // axios.defaults.withCredentials = true
    axios.defaults.headers.common['X-API-Key'] = process.env.VUE_APP_API_KEY
    axios.defaults.headers['Accept-Language'] = store.state.currentLanguage
  },

  removeHeader() {
    axios.defaults.headers.common = {}
  },

  get(resource) {
    this.setHeader()
    return axios.get(resource)
  },

  post(resource, data) {
    return axios.post(resource, data)
  },

  put(resource, data) {
    return axios.put(resource, data)
  },

  delete(resource) {
    return axios.delete(resource)
  },

  /**
   * Perform a custom Axios request.
   *
   * data is an object containing the following properties:
   *  - method
   *  - url
   *  - data ... request payload
   *  - auth (optional)
   *    - username
   *    - password
   **/
  customRequest(data) {
    return axios(data)
  }
}

export default ApiService
