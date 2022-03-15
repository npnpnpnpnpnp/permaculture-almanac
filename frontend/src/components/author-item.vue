<template>
  <li :class="$style.component">
    <router-link :to="author.meta.url" :class="classes.link">
      <div v-html="author.fields.title" />
    </router-link>
  </li>
</template>

<script>
export default {
  props: {
    author: {
      type: Object,
      required: true
    }
  },
  computed: {
    classes() {
      return {
        link: [this.$style.link, this.hasContent ? '' : this.$style.noContent]
      }
    },
    hasContent() {
      return this.author.fields.body.length > 0
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

  &.noContent {
    pointer-events: none;
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
