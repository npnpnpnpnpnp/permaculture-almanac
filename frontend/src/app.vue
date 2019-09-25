<template>
  <component :is="layout" v-if="initialized">
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
  computed: {
    ...mapState(['initialized', 'pageTitle', 'metaDescription']),
    layout() {
      return this.$route.meta.layout
        ? `${this.$route.meta.layout}Layout`
        : 'DefaultLayout'
    }
  }
}
</script>

<style lang="scss">
@import '@/styles/defaults.scss';
</style>
