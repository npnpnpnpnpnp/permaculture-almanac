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
    // matches() {
    //   // NOTE: with the uncommented code, we only show explicit matches
    //   // authors,
    //   let matches = false
    //   // let results = []
    //   // filter should work as follows:
    //   // for every section: show every item that includes art least one of the selected criteria
    //   // across sections: show all items that use those filters altogether.  match the combined criterias, e.g. all categories PLUS 1 specific tag should only show items that match the categories and, additionally, are tagged with selected tag

    //   // only show items that match all selected categories
    //   // problem: only one selectable -> either: change radios to only one selectable option or show all items which include of of the selected categories
    //   // problem: conflicts with tags where every tag has to match.

    //   // this.selectedCategories.forEach(selectedCategory => {
    //   //   categoryMatches = selectedCategory === this.category ? true : false
    //   //   results.push(categoryMatches)
    //   // })
    //   // if category filter was used, at least one of the categories has to be present in current item
    //   // let categoryMatches = false
    //   // // let categories = []
    //   // this.selectedCategories.forEach(selectedCategory => {
    //   //   categoryMatches = selectedCategory === this.category ? true : false
    //   //   if (categoryMatches) {
    //   //     results.push(categoryMatches)
    //   //     // console.log('categories', categories)
    //   //   } else return
    //   // })

    //   // only show items with all tags matched with selected category
    //   // let tagMatches = false
    //   // this.selectedTags.forEach(selectedTag => {
    //   //   tagMatches = this.item.fields.tags.includes(selectedTag)
    //   //   results.push(tagMatches)
    //   // })

    //   // if tag filter was used, at least one of the categories has to be present in current item
    //   // let tagMatches = false
    //   // // let tags = []
    //   // this.selectedTags.forEach(selectedTag => {
    //   //   tagMatches = this.item.fields.tags.includes(selectedTag)
    //   //   if (tagMatches) {
    //   //     results.push(tagMatches)
    //   //     // console.log('tags)
    //   //   } else return false
    //   // })
    //   // arrays define if filter was selected and if value matches due to length
    //   // if (categories.length > 0) {

    //   // }
    //   // // console.log('cat match', categoriesMatch)
    //   // let tagsMatch = tags.length > 0 ? true : false
    //   // console.log('tag match', tagsMatch)

    //   // matches = categoriesMatch && tagsMatch
    //   // matches = results.includes(true)
    //   // check which filters were used and, depending on filter, check if
    //   // within computed, check firstly, if filter was used with length of array filterUsed = true in data. eval if category matches.
    //   // other computed: check if category's filterUsed. if yes, see if array contains a true.
    //   // check if tagsfilterUsed. if yes, see if array contains true.isFiltered
    //   // use counter to count if filter were used. length of array with true's has to match amount of counter

    //   // let filters = [...this.selectedCategories, ...this.selectedTags]
    //   // to be matching, an item has to match all given array contents
    //   // console.log(this.item.includes(filters))

    //   // let categoryMatches = false
    //   // if categories are selected

    //   // let tagMatches = false

    //   // } else return false

    //   // console.log('cat', categoryMatches + 'tag', tagMatches)
    //   matches = this.tagMatches && this.categoryMatches
    //   //  matches = results.every(item => item === true)
    //   return matches
    // },
    itemMatches() {
      let matches = false
      // make sure that selected authors are also considered in here
      if (this.isFilteredByCategory && this.isFilteredByTag) {
        matches = this.categoryMatches && this.tagMatches
      } else
        matches = this.tagMatches || this.categoryMatches || this.authorMatches
      return matches
    },
    categoryMatches() {
      if (!this.isFilteredByCategory) return false
      return this.selectedCategories.includes(this.category)
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
      this.selectedAuthors.forEach(selectedAuthor => {
        // necessary to collect all matching items to account for multiple selection
        authorMatches = this.item.fields.author.includes(selectedAuthor)
        authorMatches ? authors.push(authorMatches) : false
      })
      return authors.includes(true)
    },

    // isCurrent() {
    //   return this.item.fields. this.id
    // },
    isFiltered() {
      return (
        this.isFilteredByCategory ||
        this.isFilteredByTag ||
        this.isFilteredByAuthor
      )
    },
    showItem() {
      let isVisible = true
      if (this.isFiltered) {
        isVisible = this.itemMatches
      } else isVisible = true
      return isVisible
    }
  }
  // methods: {},
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
