<template>
  <div :class="$style.component" v-if="items.length">
    <resource-header />
    <repeater-matrix-item
      v-for="(item, index) in items"
      :item="item"
      :key="`item-${index}`"
      :class="$style.item"
    />
  </div>
</template>

<script>
import RepeaterMatrixItem from '@/components/repeater-matrix-item'
import ResourceHeader from '@/components/resource-header'

export default {
  components: { RepeaterMatrixItem, ResourceHeader },
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
