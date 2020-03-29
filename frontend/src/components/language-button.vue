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
    isCurrent() {
      return this.language.name === this.currentLanguage
    },
    buttonClass() {
      return [
        this.$style.component,
        this.isCurrent ? this.$style['is-active'] : ''
      ]
    }
  },
  methods: {
    switchLanguage() {
      if (this.isCurrent) return

      this.$store.commit('setLanguage', {
        lang: this.language.name
      })
    }
  }
}
</script>

<style lang="scss" module>
// .component {}
</style>
