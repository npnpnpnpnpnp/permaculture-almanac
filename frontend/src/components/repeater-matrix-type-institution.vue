<template>
  <tr :class="$style.component">
    <a
      :href="item.fields.external_url"
      target="_blank"
      rel="noopener"
      :class="$style.link"
    >
      <div v-html="item.fields.title" :class="$style.title" />
      <div v-html="item.fields.subtitle" :class="$style.subtitle" />
    </a>
    <base-bodytext :text="truncatedText" :class="$style.description" />
    <div v-html="item.meta.template" :class="$style.category" />
  </tr>
</template>

<script>
import BaseBodytext from '@/components/base-bodytext'
import { truncateText } from '@/mixins/truncate-text'

export default {
  mixins: [truncateText],
  components: {
    BaseBodytext
  },
  props: {
    item: {
      type: Object,
      required: true
    }
  },
  mounted() {
    this.getCharacters(this.item.fields.body) // method defined in mixin
  }
}
</script>

<style lang="scss" module>
.component {
  @extend %grid-columns;

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

.category {
  &::first-letter {
    text-transform: uppercase;
  }
}
</style>
