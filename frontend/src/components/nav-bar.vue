<template>
  <ul :class="$style['nav-list']">
    <NavBarRoutes :routes="routes" />
  </ul>
</template>

<script>
import NavBarRoutes from './nav-bar-routes'
import { mapState } from 'vuex'

export default {
  components: { NavBarRoutes },
  computed: {
    ...mapState(['routes'])
  }
}
</script>

<style lang="scss" module>
//.nav-list {}
</style>
