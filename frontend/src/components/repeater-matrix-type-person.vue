<template>
  <li :class="$style.component">
    <div v-html="item.fields.title" />
    <div :class="$style.body">
      <base-bodytext :class="$style.text" :text="item.body" />
    </div>
  </li>
</template>

<script>
import BaseBodytext from '@/components/base-bodytext'

export default {
  components: { BaseBodytext },
  props: {
    item: {
      type: Object,
      required: true,
      default: () => {}
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
