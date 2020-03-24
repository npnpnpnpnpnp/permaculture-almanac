import ApiService from '@/services/api'
import store from '@/store'

const PageService = {
  get: async function(request) {
    try {
      const response = await ApiService.get(
        `page/${request.id}/${store.state.currentLanguage}`
      )
      return response.data
    } catch (e) {
      // TODO: implement proper error handling
      alert(e)
    }
  }
}

export default PageService
