<template>
  <ul :class="$style.list">
    <NavBarRoutes :routes="routes" />
  </ul>
</template>

<script>
import NavBarRoutes from '@/components/nav-bar-routes'
import { mapState } from 'vuex'

export default {
  components: { NavBarRoutes },
  computed: {
    ...mapState(['routes'])
  }
}
</script>

<style lang="scss" module>
//.list {}
</style>
