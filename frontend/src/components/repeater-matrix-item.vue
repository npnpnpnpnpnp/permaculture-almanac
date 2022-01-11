<template>
  <component
    v-show="showItem"
    :is="type"
    :item="item"
    :class="classes.component"
    :matching-tags="matchingTags"
  />
</template>

<script>
export default {
  components: {
    RepeaterMatrixTypeInstitution: () =>
      import('@/components/repeater-matrix-type-institution'),
    RepeaterMatrixTypeVideo: () =>
      import('@/components/repeater-matrix-type-video'),
    RepeaterMatrixTypePodcast: () =>
      import('@/components/repeater-matrix-type-podcast'),
    RepeaterMatrixTypePublication: () =>
      import('@/components/repeater-matrix-type-publication'),
    RepeaterMatrixTypeTool: () =>
      import('@/components/repeater-matrix-type-tool'),
    RepeaterMatrixTypePerson: () =>
      import('@/components/repeater-matrix-type-person')
  },
  props: {
    item: {
      type: [Array, Object], // to account for media AND title
      required: true
    },
    selectedCategories: {
      type: Array,
      required: true
    },
    selectedTags: {
      type: Array,
      default: () => []
    },
    selectedAuthors: {
      type: Array,
      default: () => []
    }
    // id: {
    //   type: String,
    //   required: true
    // },
    // currentIndex: {
    //   type: Number,
    //   required: true
    // }
  },
  // data() {
  //   return {}
  // },
  computed: {
    classes() {
      return {
        component: [this.$style.component, this.type]
      }
    },
    type() {
      return `repeater-matrix-type-${this.item.meta.template}`
    },
    category() {
      return this.item.meta.template
    },
    isFilteredByCategory() {
      return this.selectedCategories.length > 0
    },
    isFilteredByTag() {
      return this.selectedTags.length > 0
    },
    isFilteredByAuthor() {
      return this.selectedAuthors.length > 0
    },
    itemMatches() {
      // filter should work as follows:
      // for every section, show every item that includes art least one of the selected criteria
      // across sections show all items that use those filters altogether.  match the combined criterias, e.g. all categories PLUS 1 specific tag should only show items that match the categories and, additionally, are tagged with selected tag
      // NOTE: still not on point as e.g. multiple selected tags + author + category shoudl only display an item who matches all criteria. due to tagMatches, only one item has to match to be visible. is conflicts with the filtering if more filter are applied
      let results = []
      let matches = false
      if (this.isFilteredByCategory) results.push(this.categoryMatches === true)
      if (this.isFilteredByTag) results.push(this.tagMatches === true)
      if (this.isFilteredByAuthor) results.push(this.authorMatches === true)
      matches = results.every(item => item === true)
      return matches
    },
    categoryMatches() {
      // TODO: why is filter not working?
      if (!this.isFilteredByCategory) return false
      let categoryMatches = false
      let categories = []
      this.selectedCategories.map(selectedCategory => {
        // necessary to collect all matching items to account for multiple selection
        categoryMatches = selectedCategory.fields.title === this.category // if yes, push them into tags array, if not return false
        categoryMatches ? categories.push(categoryMatches) : false
      })
      return categories.includes(true)
    },
    tagMatches() {
      // TODO: why is filter not working?
      // do not execute for items without tags
      if (!this.isFilteredByTag || !this.item.fields.tags) return false
      let tagMatches = false
      let tags = []
      // for each selected tag..
      this.selectedTags.map(selectedTag => {
        // necessary to collect all matching items to account for multiple selection
        // .. check if one of the tags of the item matches
        this.item.fields.tags.map(tag => {
          tagMatches = tag.meta.id === selectedTag.meta.id
          // if yes, push them into tags array, if not return false
          tagMatches ? tags.push(tagMatches) : false
        })
      })
      return tags.includes(true)
    },
    // TODO: use id here for unique identification
    authorMatches() {
      // do not execute for items without authors
      if (!this.isFilteredByAuthor || !this.item.fields.author) return false
      let authorMatches = false
      let authors = []
      this.selectedAuthors.map(selectedAuthor => {
        // necessary to collect all matching items to account for multiple selection
        this.item.fields.author.map(author => {
          // check based on id, if author matches
          authorMatches = author.meta.id === selectedAuthor.meta.id
          // if yes, push them into author array, if not return false
          authorMatches ? authors.push(authorMatches) : false
        })
      })
      return authors.includes(true)
    },
    isFiltered() {
      return (
        this.isFilteredByCategory ||
        this.isFilteredByTag ||
        this.isFilteredByAuthor
      )
    },
    showItem() {
      return this.isFiltered ? this.itemMatches : true
    },
    matchingTags() {
      if (!this.tagMatches) return
      return this.selectedTags
    }
  }
}
</script>

<style lang="scss" module>
.component {
  display: grid;
  // based on: https://stackoverflow.com/questions/43311943/prevent-content-from-expanding-grid-items
  // and: https://stackoverflow.com/questions/52861086/why-does-minmax0-1fr-work-for-long-elements-while-1fr-doesnt
  // grid-template-rows: minmax(0, 1fr) auto;
  grid-template-columns: var(--resource-header-columns);

  // only works without overflow when using fr units
  // see: https://css-tricks.com/introduction-fr-css-unit/
  // grid-gap: var(--item-image-margin);
  width: 100%;
  // height: 100vh;
}
</style>
