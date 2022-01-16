<template>
  <li :class="$style.component">
    <router-link :to="reference.meta.url" :class="$style.link">
      <div v-html="reference.fields.title" :class="$style.title" />
      <div v-html="reference.fields.subtitle" :class="$style.subtitle" />
      <base-bodytext
        v-if="reference.fields.body"
        :text="truncatedText"
        :class="$style.body"
      />
      <ul :class="$style.tags">
        <tag-item
          v-for="(tag, index) in reference.fields.tags"
          :key="`reference-tag-${index}`"
          :tag="tag"
          :is-reference="true"
        />
      </ul>
    </router-link>
  </li>
</template>

<script>
import BaseBodytext from '@/components/base-bodytext'
import TagItem from '@/components/tag-item'
import { truncateText } from '@/mixins/truncate-text'

export default {
  mixins: [truncateText],
  components: { BaseBodytext, TagItem },
  props: {
    reference: {
      type: Object,
      required: true
    }
  },
  mounted() {
    this.getCharacters(this.reference.fields.body) // method defined in mixin
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

.title,
.subtitle {
  // margin-bottom: calc(var(--blank-line) / 2);
}

.title {
  // @extend %fw-bold;
}

.body,
.tags {
  margin-top: calc(var(--blank-line) / 2);
}

.tags {
  margin-left: calc(var(--gutter) * -1);
}

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
