<template>
  <div v-show="showFilter" :class="$style.component">
    <!-- <div v-html="labels.title" :class="$style.title" /> -->
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
        @update-tags="updateTagFilter"
      />
      <author-filter
        :default-authors="defaultAuthors"
        :selected-authors="filter.selectedAuthors"
        @update-authors="updateAuthorFilter"
      />
    </div>
    <div v-if="!isDesktop" :class="$style.controls">
      <button
        v-show="hasFilterApplied"
        type="button"
        :class="$style.reset"
        @click="reset"
      >
        {{ labels.reset }}
      </button>
      <button type="button" @click="apply" :class="$style.apply">
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
    ...mapState(['isDesktop']),
    classes() {
      return {
        component: [
          this.$style.component,
          this.filterVisible ? this.$style.filterVisible : ''
        ]
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
    }
  }
}
</script>

<style lang="scss" module>
.component {
  position: relative;
  z-index: 1;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  background-color: var(--white);

  @media (min-width: $medium) {
    position: sticky;
  }
}

.title {
  margin-bottom: var(--filter-spacing-bottom);
}

.controls {
  position: fixed;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  width: 100%;
  bottom: 0;
  padding: calc(var(--blank-line) / 2) var(--gutter);
  background-color: var(--white-alpha);
}

.reset {
  grid-column: 1;
}

.apply {
  grid-column: 2;
}
</style>
