<template>
  <div :class="$style.component" @click="delegateLinks" v-html="text" />
</template>

<script>
import { delegateLinks } from '@/mixins/delegate-links'

export default {
  inheritAttrs: false,
  mixins: [delegateLinks],
  props: {
    text: {
      type: String,
      default: ''
    }
  }
}
</script>

<style lang="scss" module>
//.component {}
</style>
