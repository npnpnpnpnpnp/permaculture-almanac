<template>
  <div :class="$style.component">
    <div v-html="item.fields.title" :class="$style.title" />
    <div v-html="item.meta.template" />
  </div>
</template>

<script>
export default {
  props: {
    item: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" module>
// .component {
//   position: relative;
// }

// .text {
//   position: absolute;
//   top: 50%;
//   left: 50%;
//   width: 100%;
//   height: 100%;
//   padding: calc(var(--gutter) * 4) var(--gutter);
//   transform: translate(-50%, -50%);

//   @media (min-width: $medium) {
//     padding: var(--slide-padding);
//   }
// }

// .title {
//   @extend %fs-large;

//   display: flex; // to center content due to inheriting height
//   align-items: center;
//   justify-content: center;
//   height: inherit;
//   overflow: hidden;
//   text-align: center;
//   text-transform: uppercase;
//   word-break: break-word;
// }
</style>
