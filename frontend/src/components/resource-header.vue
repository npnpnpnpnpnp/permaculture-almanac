<template>
  <tr :class="$style.component">
    <!-- NOTE: the actual data does not have to be passed into header. "fields.title" only serves as a reference for the structure within the actual item -->
    <v-th sortKey="fields.title">{{ labels.title }}</v-th>
    <!-- TODO: how to deal with multiple values like in author or tags? -->
    <v-th :sortKey="authorSort">{{ labels.author }}</v-th>
    <v-th :sortKey="tagSort">{{ labels.tags }}</v-th>
  </tr>
</template>

<script>
export default {
  // components: {},
  data() {
    return {
      labels: {
        title: 'Title',
        author: 'Author',
        tags: 'Tags'
      }
    }
  },
  methods: {
    // NOTE: for now, only use first letter of first author / tags for sorting, refined function tbd
    authorSort(row) {
      return `${row.fields.author[0].fields.title}`
    },
    tagSort(row) {
      return `${row.fields.tags[0].fields.title}`
    }
  }
}
</script>

<style lang="scss" module>
.component {
  display: grid;
  // based on: https://stackoverflow.com/questions/43311943/prevent-content-from-expanding-grid-items
  // and: https://stackoverflow.com/questions/52861086/why-does-minmax0-1fr-work-for-long-elements-while-1fr-doesnt
  // grid-template-rows: minmax(0, 1fr) auto;
  grid-template-columns: var(--resource-header-columns);
  // only works without overflow when using fr units
  // see: https://css-tricks.com/introduction-fr-css-unit/
  // grid-gap: var(--item-image-margin);
  width: 100%;
  // height: 100vh;
}
</style>
