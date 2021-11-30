<template>
  <ul :class="$style.component" v-if="items.length">
    <repeater-matrix-item
      v-for="(item, index) in items"
      :item="item"
      :key="`item-${index}`"
      :class="$style.item"
    />
  </ul>
</template>

<script>
import RepeaterMatrixItem from '@/components/repeater-matrix-item'

export default {
  components: { RepeaterMatrixItem },
  props: {
    items: {
      type: Array,
      // required: true,
      default: () => []
    }
  }
}
</script>

<style lang="scss" module>
// .item {}
</style>
