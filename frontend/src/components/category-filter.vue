<template>
  <div :class="$style.component">
    <div :class="classes.content">
      <category-filter-item
        v-for="(item, index) in defaultCategories"
        :key="`item-${index}`"
        :item="item"
        :selected-categories="selectedCategories"
        @select-category="applyFilter"
      />
      <!-- <button
        v-if="hasFilterApplied"
        type="button"
        :class="$style.delete"
        @click="resetFilter"
      >
        {{ labels.deleteFilter }}
      </button> -->
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
      this.$emit('update-filter', this.selectedCategories)
    }
  }
}
</script>

<style lang="scss" module>
.component {
  position: sticky;
  z-index: 2;
  left: 0;
  height: 100%;
  top: calc(100vh - var(--gutter) * 5);

  @media (min-width: $medium) {
    width: 33.333%;
    padding-left: var(--gutter);
    top: calc(var(--gutter) * 9);
  }

  @media (min-width: $xlarge) {
    top: calc(var(--gutter) * 10);
  }

  // @media (min-width: $xxxlarge) {
  //   width: 28%;
  // }
}

.content {
  display: none;

  @media (max-width: $medium) {
    &.is-visible {
      position: fixed;
      top: 0;
      left: 0;
      display: block;
      width: 100%;
      height: 100%;
      padding: calc(var(--gutter) / 2);
      background-color: var(--white-alpha); // don't use shorthand property
    }

    @media (min-width: $medium) {
      padding: var(--gutter);
    }
  }

  @media (min-width: $medium) {
    display: block;
  }
}

.delete {
  // @extend %ff-sans;
  // @extend %fs-overlay;
  // @extend %button-reset;

  display: block;
  margin-top: var(--blank-line);

  &::before {
    // @extend %ff-symbols;

    margin-right: var(--spacing-xsmall);
    content: '\2573';
  }
}

.toggle {
  position: relative;
  left: 50%;
  padding: calc(var(--gutter) / 2) var(--gutter);
  color: var(--grey);
  background: var(--white);
  // border: 1px solid var(--black);
  border-radius: calc(var(--gutter) / 2);
  box-shadow: 2px 2px calc(var(--gutter) / 4) var(--grey-alpha);
  transform: translateX(-50%);

  &:focus {
    background-color: var(--white);
  }

  &.is-active {
    color: var(--black);
  }

  @media (min-width: $medium) {
    display: none;
  }
}
</style>
