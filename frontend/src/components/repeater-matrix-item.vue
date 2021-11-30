<template>
  <component :is="type" :item="item" :class="classes.component" />
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
    isCurrent() {
      return `item-${this.currentIndex}` === this.id
    },
    type() {
      return `repeater-matrix-type-${this.item.meta.template}`
    }
  }
}
</script>

<style lang="scss" module>
.component {
  // display: grid;
  // based on: https://stackoverflow.com/questions/43311943/prevent-content-from-expanding-grid-items
  // and: https://stackoverflow.com/questions/52861086/why-does-minmax0-1fr-work-for-long-elements-while-1fr-doesnt
  // grid-template-rows: minmax(0, 1fr) auto;
  // grid-template-columns: 100vw;
  // only works without overflow when using fr units
  // see: https://css-tricks.com/introduction-fr-css-unit/
  // grid-gap: var(--item-image-margin);
  // width: 100vw;
  // height: 100vh;
}
</style>
