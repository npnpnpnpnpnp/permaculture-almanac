<template>
  <div :class="$style.component" v-if="items.length" :style="marginTop">
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
    },
    indicatorHeight: {
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
    ...mapState(['headerHeight', 'isDesktop']),
    headStyle() {
      const top = this.isDesktop
        ? this.headerHeight + this.controlsHeight + 'px'
        : this.headerHeight + this.controlsHeight + this.indicatorHeight + 'px'
      return {
        top: top
      }
    },
    marginTop() {
      return {
        marginTop: this.headerHeight + 'px'
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
.component {
  margin-bottom: calc(var(--blank-line) * 3);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--blank-line) * 3.5);
  }
}

.table {
  width: 100%;
  display: flex;
  flex-direction: column; // used to align table head at the top by default
}

.head {
  position: sticky;
  background-color: var(--white);
}

.item {
  padding: var(--spacing-h-small);
  margin-top: -1px; // to move whole item 1px upwards to "merge" borders of item and table head

  &:not(:first-of-type) {
    border-top: 1px dashed var(--green-light);
  }

  &:not(:last-of-type) {
    padding-bottom: var(--blank-line);
  }

  &:hover {
    background-color: var(--green-light-alpha);
  }
}
</style>
