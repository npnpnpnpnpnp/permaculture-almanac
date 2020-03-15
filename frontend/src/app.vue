<template>
  <component :is="layout" v-if="initialized">
    <router-view :key="$route.fullPath" />
  </component>
</template>

<script>
import { mapState } from 'vuex'
import EventBus from '@/event-bus'

export default {
  components: {
    DefaultLayout: () => import('@/layouts/default')
  },
  metaInfo() {
    return {
      titleTemplate: titleChunk => {
        if (!this.siteTitle) return
        return titleChunk
          ? `${titleChunk} – ${this.siteTitle[this.currentLanguage]}`
          : this.siteTitle[this.currentLanguage]
      },
      meta: [
        {
          vmid: 'description',
          name: 'description',
          content: this.metaDescription
            ? this.metaDescription[this.currentLanguage]
            : ''
        }
      ]
    }
  },
  computed: {
    ...mapState([
      'initialized',
      'currentLanguage',
      'siteTitle',
      'metaDescription'
    ]),
    layout() {
      return this.$route.meta.layout
        ? `${this.$route.meta.layout}Layout`
        : 'DefaultLayout'
    }
  },
  methods: {
    changeLanguage() {
      const newPath = this.$route.meta.url[this.currentLanguage]
      this.$router.push(newPath)
    }
  },
  created() {
    EventBus.$on('language-change', this.changeLanguage)
  }
}
</script>

<style lang="scss">
@import '@/styles/defaults.scss';
</style>
