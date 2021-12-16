<template>
  <li :class="$style.component">
    <div v-html="author.fields.title" />
  </li>
</template>

<script>
export default {
  props: {
    author: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" module>
// .component {
//   // width: 100%;
// }

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
