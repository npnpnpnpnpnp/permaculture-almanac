<template>
  <div v-show="showFilter" :class="$style.component" :style="filterStyle">
    <div v-if="!isDesktop" v-html="labels.title" :class="$style.title" />
    <div :class="$style.content">
      <category-filter
        :default-categories="defaultCategories"
        :selected-categories="filter.selectedCategories"
        :filter-visible="filterVisible"
        @update-categories="updateCategoryFilter"
      />
      <tag-filter
        :default-tags="defaultTags"
        :selected-tags="filter.selectedTags"
        :filter-visible="filterVisible"
        @update-tags="updateTagFilter"
      />
      <author-filter
        :default-authors="defaultAuthors"
        :selected-authors="filter.selectedAuthors"
        :filter-visible="filterVisible"
        @update-authors="updateAuthorFilter"
      />
    </div>
    <div :class="$style.controls">
      <button
        v-show="hasFilterApplied"
        type="button"
        :class="$style.reset"
        @click="reset"
      >
        <!-- :disabled="isDisabled" -->
        {{ labels.reset }}
      </button>
      <button
        v-if="!isDesktop"
        type="button"
        @click="apply"
        :class="$style.apply"
      >
        {{ labels.apply }}
      </button>
    </div>
  </div>
</template>

<script>
import CategoryFilter from '@/components/category-filter'
import TagFilter from '@/components/tag-filter'
import AuthorFilter from '@/components/author-filter'
import { mapState } from 'vuex'

export default {
  components: {
    CategoryFilter,
    TagFilter,
    AuthorFilter
  },
  props: {
    defaultCategories: {
      type: Array,
      required: true
    },
    defaultTags: {
      type: Array,
      required: true
    },
    defaultAuthors: {
      type: Array,
      required: true
    },
    filterVisible: {
      type: Boolean,
      required: true
    }
  },
  data() {
    return {
      labels: {
        title: 'Filter',
        open: 'Filter',
        apply: 'Apply',
        reset: 'Reset'
      },
      filter: {
        selectedCategories: [],
        selectedTags: [],
        selectedAuthors: []
      }
    }
  },
  computed: {
    ...mapState(['isDesktop', 'headerHeight']),
    classes() {
      return {
        component: [
          this.$style.component,
          this.filterVisible ? this.$style.filterVisible : ''
        ]
      }
    },
    // isDisabled() {
    //   return !this.hasFilterApplied
    // },
    filterStyle() {
      if (!this.isDesktop) return
      return {
        paddingTop: this.headerHeight + 'px'
      }
    },
    showFilter() {
      return this.isDesktop ? true : this.filterVisible
    },
    showButton() {
      return this.isDesktop ? false : this.filterVisible
    },
    hasFilterApplied() {
      return (
        this.filter.selectedCategories.length > 0 ||
        this.filter.selectedTags.length > 0 ||
        this.filter.selectedAuthors.length > 0
      )
    }
  },
  methods: {
    // reset locally, watcher emits to parent
    reset() {
      // this.filter.map(item => delete this.filter(item))
      this.filter.selectedCategories = []
      this.filter.selectedTags = []
      this.filter.selectedAuthors = []
    },
    apply() {
      this.$emit('filter-visibility', false)
    },
    close() {
      this.$emit('filter-visibility', false)
      this.reset()
    },
    updateCategoryFilter(selectedCategories) {
      this.filter.selectedCategories = selectedCategories
    },
    updateTagFilter(selectedTags) {
      this.filter.selectedTags = selectedTags
    },
    updateAuthorFilter(selectedAuthors) {
      this.filter.selectedAuthors = selectedAuthors
    }
  },
  watch: {
    // emit collective filter object to parent whenever any of the arrays gets updated for their children
    filter: {
      deep: true,
      handler() {
        this.$emit('update-filter', this.filter)
      }
    },
    filterVisible() {
      this.filterVisible
        ? (document.body.style.overflow = 'hidden')
        : (document.body.style.overflow = 'auto')
    }
  }
}
</script>

<style lang="scss" module>
.component {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 2;
  width: 100%;
  background-color: var(--white);
  height: 100%;
  overflow-y: auto;
  padding: var(--gutter);
  // hide scrollbars in browsers
  // scrollbar-width: none;

  // &::-webkit-scrollbar {
  //   display: none;
  // }

  @media (min-width: $medium) {
    position: fixed;
    left: unset;
    top: unset;
    width: 33.333%;
    padding: unset;
    z-index: 0;
  }

  @media (min-width: $large) {
    width: 25%;
  }
}

.content {
  margin-bottom: calc(var(--blank-line) * 3);
}

.title {
  @extend %fw-bold;

  margin-bottom: var(--filter-spacing-bottom);
  text-align: center;
  text-transform: uppercase;
  letter-spacing: var(--letter-spacing-large);
  color: var(--green-light);
}

.controls {
  position: fixed;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: var(--gutter);
  width: 100%;
  bottom: 0;
  left: 0;
  padding: var(--gutter) var(--gutter) calc(var(--blank-line) / 2) var(--gutter);
  background-image: linear-gradient(to top, white, rgba(255, 255, 255, 0) 100%);

  @media (min-width: $medium) {
    display: inline-block;
    width: initial;
    left: unset;
    padding: 0 0 var(--blank-line) 0;
    background-image: unset;
    z-index: 2;
  }
}

.reset,
.apply {
  @extend %button-default;

  background-color: var(--white);
  max-width: 6em;

  @media (min-width: $medium) {
    width: 5em;
  }
}

.reset {
  grid-column: 1;

  @media (min-width: $medium) {
    grid-column: unset;
  }
}

.apply {
  grid-column: 2;
}
</style>
