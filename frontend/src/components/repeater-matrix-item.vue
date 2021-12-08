<template>
  <component
    v-show="showItem"
    :is="type"
    :item="item"
    :class="classes.component"
  />
  <!-- :is-current="isCurrent" -->
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
    matches() {
      // NOTE: with the uncommented code, we only show explicit matches
      // authors,
      let matches = false
      let results = []
      // filter should work as follows:
      // for every section: show every item that includes art least one of the selected criteria
      // across sections: show all items that match the combined criterias, e.g. all categories PLUS 1 specific tag

      // only show items that match all selected categories
      // problem: only one selectable -> either: change radios to only one selectable option or show all items which include of of the selected categories
      // problem: conflicts with tags where every tag has to match.

      // this.selectedCategories.forEach(selectedCategory => {
      //   categoryMatches = selectedCategory === this.category ? true : false
      //   results.push(categoryMatches)
      // })

      let categoryMatches = false
      this.selectedCategories.forEach(selectedCategory => {
        categoryMatches = selectedCategory === this.category ? true : false
        if (categoryMatches) {
          results.push(categoryMatches)
        } else return
      })

      // only show items with all tags matched with selected category
      // let tagMatches = false
      // this.selectedTags.forEach(selectedTag => {
      //   tagMatches = this.item.fields.tags.includes(selectedTag)
      //   results.push(tagMatches)
      // })

      let tagMatches = false
      this.selectedTags.forEach(selectedTag => {
        tagMatches = this.item.fields.tags.includes(selectedTag)
        if (tagMatches) {
          results.push(tagMatches)
        } else return false
      })

      matches = results.includes(true)

      //  matches = results.every(item => item === true)
      return matches
    },
    // isCurrent() {
    //   return this.item.fields. this.id
    // },
    isFiltered() {
      return this.selectedCategories.length > 0 || this.selectedTags.length > 0
    },
    showItem() {
      let isVisible = true
      if (this.isFiltered) {
        isVisible = this.matches
      } else isVisible = true
      return isVisible
    }
  }
  // methods: {},
  // watch: {}
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
