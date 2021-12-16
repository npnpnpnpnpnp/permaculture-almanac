<template>
  <div :class="$style.component" v-if="items.length">
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
          :selected-categories="selectedCategories"
          :selected-tags="selectedTags"
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
    },
    query: {
      type: String,
      default: () => ''
    },
    selectedCategories: {
      type: Array,
      default: () => []
    },
    selectedTags: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      filters: {
        filter: { value: '', custom: this.fieldFilter }
      }
    }
  },
  methods: {
    authorFilter(filterValue, row) {
      let filter = null
      row.fields.author.map(author => {
        filter = author.fields.title.includes(filterValue)
      })
      return filter
    },
    tagFilter(filterValue, row) {
      let filter = null
      row.fields.tags.map(tag => {
        filter = tag.fields.title.includes(filterValue)
      })
      return filter
    },
    fieldFilter(filterValue, row) {
      return row.fields.title.toLowerCase().includes(filterValue)
      // (
      //   this.authorFilter(filterValue, row) || this.tagFilter(filterValue, row)
      // )
    }
  },
  // use passed query from sibling search input for filtering whenever it changes
  watch: {
    query() {
      this.filters.filter.value = this.query
    }
  }
}
</script>

<style lang="scss" module>
// .item {}
.table {
  width: 100%;
}
</style>
