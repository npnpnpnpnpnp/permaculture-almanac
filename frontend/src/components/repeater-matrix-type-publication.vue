<template>
  <a :href="item.meta.url" rel="noopener" :class="$style.link">
    <div v-html="item.fields.title" />
    <ul v-if="item.fields.author">
      <author-item
        v-for="(author, index) in item.fields.author"
        :author="author"
        :key="`author-${index}`"
      />
    </ul>
    <ul v-if="item.fields.tags">
      <tag-item
        v-for="(tag, index) in item.fields.tags"
        :tag="tag"
        :key="`tag-${index}`"
      />
    </ul>
    <div v-html="item.meta.template" />
  </a>
</template>

<script>
import AuthorItem from '@/components/author-item'
import TagItem from '@/components/tag-item'

export default {
  components: {
    AuthorItem,
    TagItem
  },
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
