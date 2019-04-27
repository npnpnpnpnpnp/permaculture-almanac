<template>
  <div :class="$style.layout">
    <SiteHeader />
    <slot />
  </div>
</template>

<script>
import SiteHeader from '@/components/site-header'

export default {
  components: { SiteHeader },
  metaInfo() {
    return {
      title: this.$route.meta.title
    }
  }
}
</script>

<style lang="scss" module>
//.layout {}
</style>
