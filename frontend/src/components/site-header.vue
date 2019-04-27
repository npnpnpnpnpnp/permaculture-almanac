<template>
  <header :class="$style.component">
    <h1 :class="$style.title">{{ pageTitle }}</h1>
    <NavBar />
  </header>
</template>

<script>
import NavBar from '@/components/nav-bar'
import { mapState } from 'vuex'

export default {
  components: { NavBar },
  computed: {
    ...mapState(['pageTitle'])
  }
}
</script>

<style lang="scss" module>
//.component {}
//.title {}
</style>
