<template>
  <div v-if="showFilter" :class="$style.component">
    <button
      v-if="showButton"
      type="button"
      @click="closeFilter"
      :class="$style.button"
    >
      <span :class="$style.close" />
    </button>
    <div v-html="labels.title" :class="$style.title" />
    <div :class="$style.content">
      <category-filter
        :default-categories="defaultFilters.categories"
        @update-categories="updateCategoryFilter"
      />
      <tag-filter :default-tags="defaultTags" @update-tags="updateTagFilter" />
      <author-filter
        :default-authors="defaultAuthors"
        @update-authors="updateAuthorFilter"
      />
    </div>
    <!-- <button type="button" @click="toggleFilter" :class="classes.toggle">
      {{ labels.openFilter }}
    </button> -->
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
    defaultFilters: {
      type: Object,
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
        openFilter: 'Filter',
        closeFilter: 'Delete filter'
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
    }
  },
  methods: {
    updateCategoryFilter(selectedCategories) {
      this.filter.selectedCategories = selectedCategories
    },
    updateTagFilter(selectedTags) {
      this.filter.selectedTags = selectedTags
    },
    updateAuthorFilter(selectedAuthors) {
      this.filter.selectedAuthors = selectedAuthors
    },
    closeFilter() {
      this.$emit('filter-visibility', false)
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
  .filterVisible & {
    margin-bottom: var(--filter-spacing-bottom);
  }
}

.button {
  position: absolute;
  top: 0;
  right: 0;
}

.close {
  &:after {
    content: '\00d7';
  }
  // position: relative;
  // left: 50%;
  // padding: calc(var(--gutter) / 2) var(--gutter);
  // color: var(--grey);
  // background: var(--white);
  // // border: 1px solid var(--black);
  // border-radius: calc(var(--gutter) / 2);
  // box-shadow: 2px 2px calc(var(--gutter) / 4) var(--grey-alpha);
  // transform: translateX(-50%);

  // &:focus {
  //   background-color: var(--white);
  // }

  // &.is-active {
  //   color: var(--black);
  // }

  // @media (min-width: $medium) {
  //   display: none;
  // }
}

// .delete {
//   // @extend %ff-sans;
//   // @extend %fs-overlay;
//   // @extend %button-reset;

//   display: block;
//   margin-top: var(--blank-line);

//   &::before {
//     // @extend %ff-symbols;

//     margin-right: var(--spacing-xsmall);
//     content: '\2573';
//   }
// }
</style>
