<template>
  <div :class="$style.component">
    Filter
    <div :class="classes.content">
      <category-filter
        :default-categories="defaultFilters.categories"
        @update-categories="updateCategoryFilter"
      />
      <tag-filter
        :default-tags="defaultFilters.tags"
        @update-tags="updateTagFilter"
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

export default {
  components: {
    CategoryFilter,
    TagFilter
  },
  props: {
    defaultFilters: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      labels: {
        openFilter: 'Filter',
        closeFilter: 'Delete filter'
      },
      filter: {
        selectedCategories: [],
        selectedTags: []
      }
    }
  },
  computed: {
    classes() {
      return {
        component: [this.$style.component],
        content: [
          this.$style.content,
          this.filterVisible ? this.$style['is-visible'] : ''
        ]
      }
    }
  },
  methods: {
    updateCategoryFilter(selectedCategories) {
      this.filter.selectedCategories = selectedCategories
    },
    updateTagFilter(selectedTags) {
      this.filter.selectedTags = selectedTags
    }
  },
  watch: {
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
  // position: sticky;
  // z-index: 2;
  // left: 0;
  // height: 100%;
  // top: calc(100vh - var(--gutter) * 5);

  // @media (min-width: $medium) {
  //   width: 33.333%;
  //   padding-left: var(--gutter);
  //   top: calc(var(--gutter) * 9);
  // }

  // @media (min-width: $xlarge) {
  //   top: calc(var(--gutter) * 10);
  // }

  // @media (min-width: $xxxlarge) {
  //   width: 28%;
  // }
}

// .content {
//   display: none;

//   @media (max-width: $medium) {
//     &.is-visible {
//       position: fixed;
//       top: 0;
//       left: 0;
//       display: block;
//       width: 100%;
//       height: 100%;
//       padding: calc(var(--gutter) / 2);
//       // background-color: var(--white-alpha); // don't use shorthand property
//     }

//     @media (min-width: $medium) {
//       padding: var(--gutter);
//     }
//   }

//   @media (min-width: $medium) {
//     display: block;
//   }
// }
</style>
