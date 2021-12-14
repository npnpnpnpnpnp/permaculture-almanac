<template>
  <ul :class="$style.component">
    <nav-bar-item
      v-for="route in visibleRoutes"
      :key="route.id"
      :route="route"
    />
  </ul>
</template>

<script>
import { mapState } from 'vuex'
import NavBarItem from '@/components/nav-bar-item'

export default {
  components: {
    NavBarItem
  },
  computed: {
    ...mapState(['routes']),
    visibleRoutes() {
      return this.routes.filter(route => route.meta.template !== 'home')
    }
  }
}
</script>

<style lang="scss" module>
.component {
  display: flex;

  @media (min-width: $medium) {
    grid-column: 3;
  }
}
// .is-active {}
</style>
