<template>
  <div :class="$style.layout">
    <site-header />
    <transition name="t-view" mode="out-in" @before-enter="beforeEnter">
      <keep-alive>
        <slot />
      </keep-alive>
    </transition>
  </div>
</template>

<script>
import SiteHeader from '@/components/site-header'

export default {
  components: { SiteHeader },
  methods: {
    beforeEnter() {
      this.$root.$emit('trigger-scroll')
    }
  }
}
</script>

<style lang="scss" scoped>
@include t-fade('t-view');
</style>

<style lang="scss" module>
// .layout {}
</style>
