<template>
  <li v-html="item.fields.title" :class="$style.component" />
</template>

<script>
export default {
  props: {
    item: {
      type: Object,
      required: true
    }
  }
  // data() {
  //   return {}
  // },
  // computed: {}
}
</script>

<style lang="scss" module>
.component {
  display: inline-block;
}
</style>
