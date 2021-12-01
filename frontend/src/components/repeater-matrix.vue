<template>
  <div :class="$style.component" v-if="items.length">
    <label>Filter:</label>
    <input class="form-control" v-model="filters.author.value" />
    <v-table
      :data="items"
      :filters="filters"
      :hideSortIcons="false"
      :class="$style.table"
    >
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
  },
  data() {
    return {
      filters: {
        title: { value: '', keys: ['fields.title'] },
        author: { value: '', custom: this.authorFilter },
        tags: { value: '', custom: this.tag }
      }
    }
  },
  computed: {
    modelKeys() {
      return (
        this.filters.title.value ||
        this.filters.author.value ||
        this.filters.tags.value
      )
    }
  },
  methods: {
    authorFilter(filterValue, row) {
      let filter = null
      row.fields.author.map(author => {
        filter = author.fields.title.includes(filterValue)
      })
      return filter
    }
  }
}
</script>

<style lang="scss" module>
// .item {}
</style>
