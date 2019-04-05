<template>
  <div id="app">
    <!--
    Even when routes use the same component, treat them
    as distinct and create the component again.
    -->
    <RouterView :key="$route.fullPath" />
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
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
    ...mapState(['initialized', 'pageTitle', 'metaDescription'])
  }
}
</script>

<style lang="scss">
@import '@/styles/defaults.scss';
</style>
