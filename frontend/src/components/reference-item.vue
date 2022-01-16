<template>
  <li :class="$style.component">
    <router-link :to="reference.meta.url" :class="$style.link">
      <div v-html="reference.fields.title" />
    </router-link>
  </li>
</template>

<script>
export default {
  props: {
    reference: {
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

.link {
  @extend %link-reset;

  display: inline-block;
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
