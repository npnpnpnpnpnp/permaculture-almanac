<template>
  <main :class="$style.view" v-if="page.fields">
    <resource-filter
      :default-filters="defaultFilters"
      :default-tags="page.tags"
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
        :selected-authors="filter.selectedAuthors"
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
      query: '',
      filter: {},
      defaultFilters: {
        authors: [],
        categories: []
        // tags: []
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
      // store the updated filter value locally to be able to pass it down to repeater components
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
        categoryExists ? false : this.defaultFilters.categories.push(category)

        // push tags of each item into collective defaultFilters.tags
        // use tags from tags page instead of filtering them here. but: make sure that tags do not create separate instances on every item (same tag creates another id when selected)
        // if (!child.fields.tags) return
        // child.fields.tags.map(tag => {
        //   const tagExists = this.defaultFilters.tags.includes(tag)
        //   tagExists ? false : this.defaultFilters.tags.push(tag)
        // })

        // push authors of each item into collective defaultFilters.authors
        if (!child.fields.author) return
        child.fields.author.map(author => {
          const authorExists = this.defaultFilters.authors.includes(author)
          authorExists ? false : this.defaultFilters.authors.push(author)
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

  @media (min-width: $large) {
    grid-template-columns: 25% auto;
  }
}

.controls {
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-gap: var(--gutter);
  margin-bottom: var(--filter-spacing-bottom);

  @media (min-width: $xsmall) {
    grid-template-columns: repeat(2, 1fr);
  }

  @media (min-width: $medium) {
    margin-bottom: unset;
  }
}

.button {
  @media (min-width: $small) {
    max-width: 50%;
  }

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
