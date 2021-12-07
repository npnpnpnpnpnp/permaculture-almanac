<template>
  <main :class="$style.view" v-if="page.fields">
    <h2 :class="$style.title" v-html="page.fields.title" />
    <filter-component
      :default-categories="defaultFilters.categories"
      @update-filter="handleFilter"
    />
    <div>
      <search-input @change-value="handleSearchQuery" :value="query" />
      <repeater-matrix
        :items="page.children"
        :query="query"
        :selected-categories="filter.selectedCategories"
      />
    </div>
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import RepeaterMatrix from '@/components/repeater-matrix'
import FilterComponent from '@/components/filter-component.vue'
import SearchInput from '@/components/search-input'

export default {
  components: {
    RepeaterMatrix,
    FilterComponent,
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
      }
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
    this.loading = false
  },
  methods: {
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
// .view {}
// .title {}
// .body {}
</style>
