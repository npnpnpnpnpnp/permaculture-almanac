<template>
  <main :class="$style.view" v-if="page.fields">
    <h2 :class="$style.title" v-html="page.fields.title" />
    <category-filter
      :original-categories="categories"
      @update-filter="updateCategoryFilter"
    />
    <div>
      <search-input @change-value="handleSearchQuery" :value="query" />

      <!-- :original-tags="page.tags" -->
      <repeater-matrix
        :items="page.children"
        :selected-categories="selectedCategories"
        :query="query"
      />
    </div>
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import RepeaterMatrix from '@/components/repeater-matrix'
import CategoryFilter from '@/components/category-filter'
import EventBus from '@/event-bus'
import SearchInput from '@/components/search-input'

export default {
  components: {
    RepeaterMatrix,
    CategoryFilter,
    SearchInput
  },
  mixins: [metaInfo],
  data() {
    return {
      page: {},
      categories: [],
      selectedCategories: [],
      query: ''
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
  },
  methods: {
    // get current search value from search-input
    handleSearchQuery(query) {
      this.query = query
    },
    handleCategory(category) {
      const categoryExists = this.categories.includes(category)
      if (categoryExists) return
      this.categories.push(category)
    },
    updateCategoryFilter(categories) {
      this.selectedCategories = categories
    }
  },
  mounted() {
    EventBus.$on('item-category', payload => {
      this.handleCategory(payload)
    })
  }
}
</script>

<style lang="scss" module>
// .view {}
// .title {}
// .body {}
</style>
