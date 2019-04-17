<template>
  <component :is="layout" v-if="pageInitialized">
    <RouterView :key="$route.fullPath" />
  </component>
</template>

<script>
import { mapState } from 'vuex'

export default {
  components: {
    DefaultLayout: () => import('@/layouts/default')
  },
  metaInfo() {
    return {
      titleTemplate: titleChunk => {
        return titleChunk ? `${titleChunk} – ${this.pageTitle}` : this.pageTitle
      },
      meta: [
        {
          vmid: 'description',
          name: 'description',
          content: this.metaDescription
        }
      ]
    }
  },
  data() {
    return {
      pageInitialized: false
    }
  },
  computed: {
    ...mapState(['initialized', 'pageTitle', 'metaDescription']),
    layout() {
      return this.$route.meta.layout
        ? `${this.$route.meta.layout}Layout`
        : 'DefaultLayout'
    }
  },
  watch: {
    initialized() {
      /*
      this.$nextTick(() => {
        this.pageInitialized = true
      })
      */
      this.pageInitialized = true
    }
  }
}
</script>

<style lang="scss">
@import '@/styles/defaults.scss';
</style>
