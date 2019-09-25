<template>
  <div :class="$style.layout">
    <site-header />
    <keep-alive>
      <slot />
    </keep-alive>
  </div>
</template>

<script>
import SiteHeader from '@/components/site-header'

export default {
  components: { SiteHeader }
}
</script>

<style lang="scss" module>
//.layout {}
</style>
