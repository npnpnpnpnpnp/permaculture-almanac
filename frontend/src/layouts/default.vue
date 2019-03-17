<template>
  <div :class="$style['layout']">
    <NavBar />
    <slot />
  </div>
</template>

<script>
import NavBar from '@/components/nav-bar'

export default {
  components: { NavBar },
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
