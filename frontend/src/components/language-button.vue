<template>
  <button @click.stop="switchLanguage" :class="buttonClass" type="button">
    {{ language.name }}
  </button>
</template>

<script>
import { mapState } from 'vuex'

export default {
  props: {
    language: {
      type: Object,
      required: true
    }
  },
  computed: {
    ...mapState(['currentLanguage']),
    buttonClass() {
      return [
        this.$style.component,
        this.language === this.currentLanguage ? this.$style['is-active'] : ''
      ]
    }
  },
  methods: {
    switchLanguage() {
      if (this.language.name === this.currentLanguage) return

      this.$store.commit('setLanguage', {
        currentLanguage: this.language
      })
    }
  }
}
</script>

<style lang="scss" module>
//.component {}
</style>
