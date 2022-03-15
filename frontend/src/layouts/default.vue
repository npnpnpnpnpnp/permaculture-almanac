<template>
  <div :class="$style.layout">
    <site-header />
    <transition name="t-view" mode="out-in" @before-enter="beforeEnter">
      <!-- @before-leave="beforeLeave" -->
      <keep-alive>
        <slot />
      </keep-alive>
    </transition>
    <site-footer
      @imprint-visible="handleImprintVisibility"
      @privacy-visible="handlePrivacyVisibility"
    />
    <imprint-overlay
      :is-visible="imprintVisible"
      @imprint-visible="handleImprintVisibility"
    />
    <privacy-overlay
      :is-visible="privacyVisible"
      @privacy-visible="handlePrivacyVisibility"
    />
  </div>
</template>

<script>
import SiteHeader from '@/components/site-header'
import SiteFooter from '@/components/site-footer'
import ImprintOverlay from '@/components/imprint-overlay.vue'
import PrivacyOverlay from '@/components/privacy-overlay.vue'
// import EventBus from '@/event-bus'

export default {
  components: { SiteHeader, SiteFooter, ImprintOverlay, PrivacyOverlay },
  data() {
    return {
      imprintVisible: false,
      privacyVisible: false
    }
  },
  methods: {
    beforeEnter() {
      this.$root.$emit('trigger-scroll')
    },
    // beforeLeave() {
    //   EventBus.$emit('home-loaded', false)
    //   EventBus.$emit('page-loaded', false)
    // },
    handleImprintVisibility(payload) {
      this.imprintVisible = payload
      // document.body.style.overflow = 'hidden'
    },
    handlePrivacyVisibility(payload) {
      this.privacyVisible = payload
      // document.body.style.overflow = 'hidden'
    }
  }
}
</script>

<style lang="scss" scoped>
@include t-fade('t-view');
</style>

<style lang="scss" module>
.layout {
  height: 100%;
  display: flex;
  flex-direction: column;
}
</style>
