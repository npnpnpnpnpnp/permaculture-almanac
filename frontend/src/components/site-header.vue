<template>
  <header v-if="!isHome" :class="$style.component" ref="header">
    <h1 :class="$style.title">{{ siteTitle }}</h1>
    <nav-bar />
    <!-- <language-switch class="language-switch" /> -->
  </header>
</template>

<script>
// import LanguageSwitch from '@/components/language-switch.vue'
import NavBar from '@/components/nav-bar'
import { mapState } from 'vuex'
import { debounce } from 'lodash'

export default {
  // components: { LanguageSwitch, NavBar },
  components: { NavBar },
  computed: {
    ...mapState(['currentLanguage', 'siteTitle']),
    isHome() {
      return this.$route.meta.template === 'home'
    }
  },
  methods: {
    getHeaderHeight() {
      if (this.isHome) return
      // send current header height to nav-item, intro slider home for scroll offset
      // emitting value in intro-slider did not work, therfore usage of store
      this.$store.commit('setHeaderHeight', {
        headerHeight: this.$refs.header.offsetHeight
      })
    },
    onResize: debounce(function() {
      if (!this.$refs.header) return
      this.getHeaderHeight()
    }, 150)
  },
  mounted() {
    this.getHeaderHeight()
    window.addEventListener('resize', this.onResize)
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
  }
}
</script>

<style lang="scss" module>
.component {
  padding: var(--gutter) var(--gutter) calc(var(--gutter) * 2) var(--gutter);
  position: sticky;
  top: 0;
  background-color: var(--white);

  @media (min-width: $xsmall) {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap: calc(var(--gutter) * 1.5);
  }

  @media (min-width: $medium) {
    grid-template-columns: 33.333% max-content auto;
    padding: var(--gutter) var(--gutter) calc(var(--gutter) * 5) var(--gutter);
  }

  @media (min-width: $large) {
    grid-template-columns: 25% max-content auto;
  }
}

.title {
  @extend %fw-bold;

  text-transform: uppercase;
  text-align: center;
  letter-spacing: var(--letter-spacing-large);
  color: var(--green-light);

  @media (min-width: $xsmall) {
    text-align: left;
  }

  @media (min-width: $medium) {
    grid-column: 2;
  }
}
</style>
