<template>
  <li :class="classes.component">
    <div v-html="tag.fields.title" />
  </li>
</template>

<script>
export default {
  props: {
    tag: {
      type: Object,
      required: true
    },
    matchingTags: {
      type: Array,
      default: () => []
    }
  },
  computed: {
    classes() {
      return {
        component: [
          this.$style.component,
          this.isCurrent ? this.$style.isCurrent : ''
        ]
      }
    },
    isCurrent() {
      return this.matchingTags.some(
        matchingTag => this.tag.meta.id === matchingTag.meta.id
      )
    }
  }
}
</script>

<style lang="scss" module>
.component {
  &.isCurrent {
    @extend %fw-bold;

    color: var(--green-light);
  }
}

// .body {
//   display: flex;
//   align-items: center;
//   justify-content: center;
// }

// .text {
//   @extend %base-bodytext;
//   @extend %ff-serif;

//   max-width: 40em;

//   a {
//     position: relative;
//     z-index: 2;
//   }
// }

// .caption {
//   @extend %fs-small;

//   position: absolute;
//   bottom: 0;
//   width: 100%;
//   padding: var(--gutter);
//   text-transform: uppercase;
// }
</style>
