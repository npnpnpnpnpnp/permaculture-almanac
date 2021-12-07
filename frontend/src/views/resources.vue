<template>
  <main :class="$style.view" v-if="page.fields">
    <resource-filter
      :default-filters="defaultFilters"
      :filter-visible="filterVisible"
      @update-filter="handleFilter"
      @filter-visibility="handleFilterVisibility"
    />
    <div :class="$style.content">
      <div :class="$style.controls">
        <search-input @change-value="handleSearchQuery" :value="query" />
        <button
          v-if="showButton"
          type="button"
          v-html="labels.openFilter"
          :class="$style.button"
          @click="openFilter"
        />
      </div>
      <repeater-matrix
        :items="page.children"
        :query="query"
        :selected-categories="filter.selectedCategories"
        :selected-tags="filter.selectedTags"
      />
    </div>
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import RepeaterMatrix from '@/components/repeater-matrix'
import ResourceFilter from '@/components/resource-filter.vue'
import SearchInput from '@/components/search-input'
import { mapState } from 'vuex'

export default {
  components: {
    RepeaterMatrix,
    ResourceFilter,
    SearchInput
  },
  mixins: [metaInfo],
  data() {
    return {
      page: {},
      loading: true,
      defaultCategories: [],
      defaultTags: [],
      query: '',
      filter: {},
      defaultFilters: {
        authors: [],
        categories: [],
        tags: []
      },
      filterVisible: false,
      labels: {
        openFilter: 'Filter'
      }
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
    this.loading = false
  },
  computed: {
    ...mapState(['isDesktop']),
    showButton() {
      return this.isDesktop ? false : true
    }
  },
  methods: {
    openFilter() {
      this.filterVisible = true
    },
    handleFilterVisibility(visibility) {
      this.filterVisible = visibility
    },
    // get all filter updates from filter component
    handleFilter(value) {
      this.filter = value
    },
    // get current search value from search-input
    handleSearchQuery(query) {
      this.query = query
    },
    getItemData() {
      this.page.children.map(child => {
        // generally check if current item of loop already exists within defaultFilters
        // push category of items into collective defaultFilters.categories
        const category = child.meta.template
        const categoryExists = this.defaultFilters.categories.includes(category)
        if (categoryExists) return
        this.defaultFilters.categories.push(category)

        // push tags of each item into collective defaultFilters.tags

        child.fields.tags.map(tag => {
          const tagExists = this.defaultFilters.tags.includes(tag)
          if (tagExists) return
          this.defaultFilters.tags.push(tag)
        })

        // push authors of each item into collective defaultFilters.authors
        child.fields.author.map(author => {
          const authorExists = this.defaultFilters.authors.includes(author)
          if (authorExists) return
          this.defaultFilters.authors.push(author)
        })
      })
    }
  },
  // mounted() {},
  watch: {
    loading() {
      // as soon as page was loaded, fetch and flatten item data used for default filter values
      this.getItemData()
    }
  }
}
</script>

<style lang="scss" module>
.view {
  @media (min-width: $medium) {
    display: grid;
    grid-template-columns: 33.333% auto;
    grid-gap: var(--gutter);
  }
}

.controls {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: var(--gutter);
  margin-bottom: var(--filter-spacing-bottom);

  @media (min-width: $medium) {
    margin-bottom: unset;
  }
}

.button {
  max-width: 50%;

  @media (min-width: $medium) {
    max-width: unset;
  }
}

// .content {
//   @media (min-width: $medium) {
//   }
// }
// .title {}
// .body {}
</style>
