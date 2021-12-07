<template>
  <component
    v-show="hasFilterApplied"
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
  data() {
    return {
      filterResults: []
    }
  },
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
    hasMatchingTags() {
      let results = []
      let result = false
      this.item.fields.tags.forEach(tag => {
        result = this.selectedTags.includes(tag)
        results.push(result)
      })
      return results
    },
    // hasMatchingCategory() {
    //   let results = []
    //   this.selectedCategories.map(category => {
    //     results.push(category === this.item.meta.template)
    //   })
    //   return results
    // },
    isFiltered() {
      return this.hasMatchingTags.includes(true)
    },
    // isCurrent() {
    //   return `item-${this.currentIndex}` === this.id
    // },

    // isFiltered() {
    //   // let result = false
    //   let results = []
    //   // only return true if passed data matches all criteria
    //   const hasTags = this.hasMatchingTags.includes(true)
    //   console.log(hasTags)
    //   const hasCategory = this.hasMatchingCategory.includes(true)
    //   console.log(hasCategory)
    //   results.push(this.hasMatchingTags.includes(true))
    //   return results.every(item => item === true)
    // },
    hasFilterApplied() {
      // const hasCategoryFilterApplied =
      //   this.selectedCategories.length === 0 || this.isFiltered
      // const hasTagFilterApplied =
      return this.selectedTags.length === 0 || this.isFiltered
      // return hasCategoryFilterApplied || hasTagFilterApplied
    }
  }
  // methods: {},
  // mounted() {}
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
