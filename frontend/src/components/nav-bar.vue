<template>
  <ul :class="$style.component">
    <li v-for="route in apiRoutes" :key="route.id">
      <router-link
        :to="route.url[currentLanguage]"
        :exact-active-class="$style['is-active']"
      >
        {{ route.title[currentLanguage] }}
      </router-link>
    </li>
  </ul>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['currentLanguage', 'apiRoutes'])
  }
}
</script>

<style lang="scss" module>
// .component {}
// .is-active {}
</style>
