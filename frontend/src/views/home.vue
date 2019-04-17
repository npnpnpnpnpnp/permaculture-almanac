<template>
  <div :class="$style.view">
    <h1 :class="$style.title">{{ pageTitle }}</h1>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['pageTitle'])
  }
}
</script>

<style lang="scss" module>
//.view {}
//.title {}
</style>
