// Decode HTML entities

export const decodeHtml = {
  methods: {
    decodeHtml(html) {
      let txt = document.createElement('textarea')
      txt.innerHTML = html
      return txt.value
    }
  }
}
