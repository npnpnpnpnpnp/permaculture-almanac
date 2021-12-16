<template>
  <li :class="$style.component">
    <a
      :href="item.fields.external_url"
      target="_blank"
      rel="noopener"
      :class="$style.link"
    >
      <div v-html="item.fields.title" :class="$style.title" />
      <div v-html="item.fields.subtitle" :class="$style.subtitle" />
    </a>

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
    <div :class="$style.description">
      <base-bodytext :text="truncatedText" />
      <div v-html="item.fields.publisher" />
      <div v-html="item.fields.isbn" />
    </div>
    <div v-html="item.meta.template" />
  </li>
</template>

<script>
import AuthorItem from '@/components/author-item'
import TagItem from '@/components/tag-item'
import BaseBodytext from '@/components/base-bodytext'
import { truncateText } from '@/mixins/truncate-text'

export default {
  mixins: [truncateText],
  components: {
    AuthorItem,
    TagItem,
    BaseBodytext
  },
  props: {
    item: {
      type: Object,
      required: true,
      default: () => {}
    }
  },
  mounted() {
    this.getCharacters(this.item.fields.body) // method defined in mixin
  }
}
</script>

<style lang="scss" module>
.component {
  display: grid;
  // based on: https://stackoverflow.com/questions/43311943/prevent-content-from-expanding-grid-items
  // and: https://stackoverflow.com/questions/52861086/why-does-minmax0-1fr-work-for-long-elements-while-1fr-doesnt
  // grid-template-rows: minmax(0, 1fr) auto;
  grid-template-columns: var(--resource-grid);
  // only works without overflow when using fr units
  // see: https://css-tricks.com/introduction-fr-css-unit/
  grid-gap: var(--gutter);
  width: 100%;
  // height: 100vh;
}

.link {
  display: inline-block;
}

.title,
.subtitle {
  hyphens: auto;
}

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
