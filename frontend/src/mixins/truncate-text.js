export const truncateText = {
  data() {
    return {
      text: '',
      // TODO: increase max length on larger screens
      maxChars: 250,
      textLength: 0
    }
  },
  computed: {
    hasLongText() {
      return this.textLength > this.maxChars
    },
    truncatedText() {
      if (!this.hasLongText) return this.text
      return this.text.substr(0, this.maxChars) + '\u2026'
    }
  },
  methods: {
    getCharacters(text) {
      this.text = text // make passed item available by storing it data
      this.textLength = text.split('').length
    }
  }
}
