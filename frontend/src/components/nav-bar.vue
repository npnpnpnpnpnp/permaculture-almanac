<template>
  <ul :class="$style.component">
    <li v-for="route in routes" :key="route.id">
      <router-link
        :to="route.meta.url"
        :exact-active-class="$style['is-active']"
      >
        {{ route.meta.title }}
      </router-link>
    </li>
  </ul>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['routes'])
  }
}
</script>

<style lang="scss" module>
// .component {}
// .is-active {}
</style>
