<template>
  <component :is="layout" v-if="initialized">
    <router-view :key="$route.fullPath" />
  </component>
</template>

<script>
import { mapState } from 'vuex'
import EventBus from '@/event-bus'
import { decodeHtml } from '@/mixins/decode-html'

export default {
  components: {
    DefaultLayout: () => import('@/layouts/default')
  },
  mixins: [decodeHtml],
  metaInfo() {
    return {
      titleTemplate: titleChunk => {
        if (!this.siteTitle) return
        return titleChunk
          ? `${titleChunk} – ${this.decodeHtml(this.siteTitle)}`
          : this.decodeHtml(this.siteTitle)
      },
      meta: [
        {
          vmid: 'description',
          name: 'description',
          content: this.metaDescription
            ? this.decodeHtml(this.metaDescription)
            : ''
        }
      ],
      htmlAttrs: {
        lang: this.currentLanguage
      }
    }
  },
  computed: {
    ...mapState([
      'currentLanguage',
      'initialized',
      'metaDescription',
      'routes',
      'siteTitle'
    ]),
    layout() {
      return this.$route.meta.layout
        ? `${this.$route.meta.layout}Layout`
        : 'DefaultLayout'
    }
  },
  created() {
    EventBus.$on('set-language', () => {
      const route = this.routes.find(route => route.name === this.$route.name)
      this.$router.push(route.meta.url)
    })
  }
}
</script>

<style lang="scss">
@import '@/styles/defaults.scss';
</style>
