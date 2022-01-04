<template>
  <div :class="$style.component" v-if="items.length">
    <v-table
      :data="items"
      :filters="filters"
      :hideSortIcons="true"
      :class="$style.table"
    >
      <thead slot="head" :class="$style.head" :style="headStyle">
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
          :selected-authors="selectedAuthors"
        />
      </tbody>
    </v-table>
  </div>
</template>

<script>
import RepeaterMatrixItem from '@/components/repeater-matrix-item'
import ResourceHeader from '@/components/resource-header'
import { mapState } from 'vuex'

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
    },
    selectedAuthors: {
      type: Array,
      default: () => []
    },
    controlsHeight: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      filters: {
        filter: { value: '', custom: this.fieldFilter }
      }
    }
  },
  computed: {
    ...mapState(['headerHeight']),
    headStyle() {
      return {
        top: this.headerHeight + this.controlsHeight + 'px'
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
.table {
  width: 100%;
}

.head {
  position: sticky;
  background-color: var(--white);
}

.item {
  padding-top: var(--spacing-h-small);

  &:not(:first-of-type) {
    border-top: 1px solid var(--green-light);
  }

  &:not(:last-of-type) {
    padding-bottom: var(--blank-line);
  }

  &:hover {
    background-color: var(--green-light-alpha);
  }
}
</style>
