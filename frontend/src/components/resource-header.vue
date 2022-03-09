<template>
  <tr :class="$style.component">
    <!-- NOTE: the actual data does not have to be passed into header. "fields.title" only serves as a reference for the structure within the actual item -->
    <v-th sortKey="fields.title" :class="$style.title">{{ labels.title }}</v-th>
    <!-- TODO: how to deal with multiple values like in author or tags? -->
    <v-th :sortKey="authorSort" :class="$style.author">{{
      labels.author
    }}</v-th>
    <v-th :sortKey="tagSort" :class="$style.tags">{{ labels.tags }}</v-th>
    <th :class="$style.description">{{ labels.description }}</th>
    <v-th sortKey="meta.template" :class="$style.category">{{
      labels.type
    }}</v-th>
  </tr>
</template>

<script>
export default {
  // components: {},
  data() {
    return {
      labels: {
        title: 'Titel',
        author: 'Author',
        tags: 'Tags',
        type: 'Typ',
        description: 'Beschreibung'
      }
    }
  },
  methods: {
    // NOTE: for now, only use first letter of first author / tags for sorting, refined function tbd
    authorSort(row) {
      if (!row.fields.author) return
      return `${row.fields.author[0].fields.title}`
    },
    tagSort(row) {
      if (!row.fields.tags) return
      return `${row.fields.tags[0].fields.title}`
    }
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
  text-align: left;
  padding-bottom: var(--spacing-h-small);
  color: var(--green-light);
  border-bottom: 1px solid var(--green-light);

  // height: 100vh;

  :global(.vt-sort::before) {
    display: inline-block;
    margin-right: calc(var(--gutter) / 6);
    color: var(--green-light);
    content: '';
  }

  :global(.vt-sortable::before) {
    content: '\2195';
  }

  :global(.vt-asc::before) {
    content: '\2191';
  }

  :global(.vt-desc::before) {
    content: '\2193';
  }
}
</style>
