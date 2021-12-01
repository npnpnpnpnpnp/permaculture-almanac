<template>
  <div :class="$style.component" v-if="items.length">
    <v-table :data="items" :hideSortIcons="true" :class="$style.table">
      <thead slot="head" :class="$style.head">
        <resource-header />
      </thead>
      <tbody slot="body" slot-scope="{ displayData }">
        <repeater-matrix-item
          v-for="(item, index) in displayData"
          :item="item"
          :key="`item-${index}`"
          :class="$style.item"
        />
      </tbody>
    </v-table>
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
