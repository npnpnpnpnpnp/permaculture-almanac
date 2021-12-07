<template>
  <main :class="$style.view" v-if="page.fields">
    <h2 :class="$style.title" v-html="page.fields.title" />
    <filter-component
      :default-categories="defaultCategories"
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
import EventBus from '@/event-bus'
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
      defaultCategories: [],
      query: '',
      filter: {}
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
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
    // push categories from repeater-matrix-item in collective array
    handleCategory(category) {
      const categoryExists = this.defaultCategories.includes(category)
      if (categoryExists) return
      this.defaultCategories.push(category)
    }
  },
  mounted() {
    // get emitted categories from repeater-matrix-item
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
