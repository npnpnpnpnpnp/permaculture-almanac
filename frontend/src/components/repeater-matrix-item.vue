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
import EventBus from '@/event-bus'

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
  computed: {
    classes() {
      return {
        component: [this.$style.component, this.type]
      }
    },
    category() {
      return this.item.meta.template
    },
    // isCurrent() {
    //   return `item-${this.currentIndex}` === this.id
    // },
    type() {
      return `repeater-matrix-type-${this.item.meta.template}`
    },
    isFiltered() {
      let result = false
      this.selectedCategories.forEach(category => {
        result = category === this.item.meta.template
      })
      return result
    },
    hasFilterApplied() {
      return this.selectedCategories.length === 0 || this.isFiltered
    }
  },
  methods: {
    emitCategory() {
      EventBus.$emit('item-category', this.category)
    }
  },
  mounted() {
    this.emitCategory()
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
