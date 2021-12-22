<template>
  <div :class="$style.component" @click="selectItem">
    <div v-html="item.fields.title" :class="$style.title" />
  </div>
</template>

<script>
export default {
  props: {
    item: {
      type: Object,
      required: true
    },
    type: {
      type: String,
      required: true
    }
  },
  methods: {
    selectItem() {
      if (this.type === 'category') this.$emit('select-category', this.item)
      if (this.type === 'tag') this.$emit('select-tag', this.item)
      if (this.type === 'author') this.$emit('select-author', this.item)
    }
  }
}
</script>

<style lang="scss" module>
.component {
  display: inline-flex;
  padding-left: var(--gutter);
  cursor: pointer;
  margin-bottom: calc(var(--blank-line) / 5);
}

.title {
  display: inline-block;
  padding: calc(var(--blank-line) / 8) calc(var(--gutter) / 2);
  border: 1px solid var(--green-light);

  border-radius: 0.8em;

  &:hover {
    background-color: var(--green-light-alpha);
  }

  // NOTE: this inserts a space after pseudo element in FF
  &::first-letter {
    text-transform: uppercase;
  }

  &::after {
    content: '\00d7';
    margin-left: var(--spacing-xsmall);
  }
}
</style>
