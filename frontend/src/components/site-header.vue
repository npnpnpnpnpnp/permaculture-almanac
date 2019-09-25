<template>
  <header :class="$style.component">
    <h1 :class="$style.title">{{ siteTitle[currentLanguage] }}</h1>
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
//.component {}
//.title {}
</style>
