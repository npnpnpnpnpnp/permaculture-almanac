<template>
  <button @click.stop="switchLanguage" :class="buttonClass" type="button">
    {{ language }}
  </button>
</template>

<script>
import { mapState } from 'vuex'

export default {
  props: {
    language: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['currentLanguage']),
    isCurrent() {
      return this.language === this.currentLanguage
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
      if (!this.isCurrent) this.$store.dispatch('setLanguage', this.language)
    }
  }
}
</script>

<style lang="scss" module>
// .component {}
</style>
