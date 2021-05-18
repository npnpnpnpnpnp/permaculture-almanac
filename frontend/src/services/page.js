import ApiService from '@/services/api'

const PageService = {
  get: async function(request) {
    try {
      const response = await ApiService.get('page/' + request.id)
      return response.data
    } catch (e) {
      // TODO: implement proper error handling
      // eslint-disable-next-line
      console.error(e)
    }
  }
}

export default PageService
