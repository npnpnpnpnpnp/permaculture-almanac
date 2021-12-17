<template>
  <div :class="$style.component">
    <div v-html="labels.title" :class="$style.title" />
    <div :class="classes.content">
      <category-filter-item
        v-for="(category, index) in defaultCategories"
        :key="`category-${index}`"
        :item="category"
        :selected-categories="selectedCategories"
        @select-category="applyFilter"
      />
    </div>
  </div>
</template>

<script>
import CategoryFilterItem from '@/components/category-filter-item'
import { mapState } from 'vuex'
// import EventBus from '@/event-bus'

export default {
  components: {
    CategoryFilterItem
  },
  props: {
    defaultCategories: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      selectedCategories: [],
      labels: {
        title: 'Categories',
        openFilter: 'Filter',
        deleteFilter: 'Filter löschen'
      }
    }
  },
  computed: {
    ...mapState(['filterVisible']),
    classes() {
      return {
        content: [
          this.$style.content,
          this.filterVisible ? this.$style['is-visible'] : ''
        ],
        toggle: [
          this.$style.toggle,
          this.hasFilterApplied ? this.$style['is-active'] : ''
        ]
      }
    },
    hasFilterApplied() {
      return this.selectedCategories.length > 0
    }
    // findIndices() {
    //   let indices = []
    //   this.filter.forEach(filterItem => {
    //     this.originalTags.forEach(originalTag => {
    //       const tagExists = originalTag.fields.title.includes(filterItem.title)

    //       if (tagExists) {
    //         const index = this.originalTags.indexOf(originalTag)
    //         indices.push({ index: index, filter: filterItem })
    //       } else return
    //     })
    //   })
    //   return indices
    // },
    // sortTags() {
    //   let sorted = this.findIndices
    //   sorted.sort(function(a, b) {
    //     return parseFloat(a.index) - parseFloat(b.index)
    //   })
    //   return sorted
    // }
  },
  methods: {
    // get category from child and push it into collective array of selected category filter
    applyFilter(category) {
      const categoryExists = this.selectedCategories.includes(category)

      // removes filter when it exists on click in child
      if (categoryExists) {
        // delete the currently clicked element from array which leads to deselection of filter
        const index = this.selectedCategories.indexOf(category)
        this.selectedCategories.splice(index, 1)
      }

      // add filter if it’s not already selected
      if (!categoryExists) {
        this.selectedCategories.push(category)
      }
    },
    // reset locally, watcher emits to parent
    resetFilter() {
      this.selectedCategories = []
    },
    toggleFilter() {
      this.$store.dispatch('setFilterVisibility')
    }
  },
  watch: {
    selectedCategories() {
      // whenever this.selectedCategories is updated, emit to parent, pass down via prop to child to handle selected category design
      this.$emit('update-categories', this.selectedCategories)
    }
  }
}
</script>

<style lang="scss" module>
.component {
  margin-bottom: var(--filter-spacing-bottom);
}

.title {
  margin-bottom: var(--blank-line);
}
</style>
