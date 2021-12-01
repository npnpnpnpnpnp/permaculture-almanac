<template>
  <main :class="$style.view" v-if="page.fields">
    <h2 :class="$style.title" v-html="page.fields.title" />
    <category-filter
      :original-categories="categories"
      @update-filter="updateCategoryFilter"
    />
    <!-- :original-tags="page.tags" -->
    <repeater-matrix
      :items="page.children"
      :selected-categories="selectedCategories"
    />
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import RepeaterMatrix from '@/components/repeater-matrix'
import CategoryFilter from '@/components/category-filter'
import EventBus from '@/event-bus'

export default {
  components: {
    RepeaterMatrix,
    CategoryFilter
  },
  mixins: [metaInfo],
  data() {
    return {
      page: {},
      categories: [],
      selectedCategories: []
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
  },
  methods: {
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
