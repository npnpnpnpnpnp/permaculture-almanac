<template>
  <header :class="$style.component">
    <h1 :class="$style.title">{{ siteTitle }}</h1>
    <nav-bar />
    <!-- <language-switch class="language-switch" /> -->
  </header>
</template>

<script>
// import LanguageSwitch from '@/components/language-switch.vue'
import NavBar from '@/components/nav-bar'
import { mapState } from 'vuex'

export default {
  // components: { LanguageSwitch, NavBar },
  components: { NavBar },
  computed: {
    ...mapState(['currentLanguage', 'siteTitle'])
  }
}
</script>

<style lang="scss" module>
.component {
  padding: var(--gutter);

  @media (min-width: $xsmall) {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap: calc(var(--gutter) * 1.5);
  }

  @media (min-width: $medium) {
    grid-template-columns: 33.333% max-content auto;
    margin-bottom: calc(var(--blank-line) * 2);
  }

  @media (min-width: $large) {
    grid-template-columns: 25% max-content auto;
  }
}

.title {
  @media (min-width: $medium) {
    grid-column: 2;
  }
}
</style>
