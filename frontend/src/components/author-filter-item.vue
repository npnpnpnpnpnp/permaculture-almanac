<template>
  <button type="button" :class="classes.component" @click="selectAuthor">
    <span v-html="item.fields.title" />
  </button>
</template>

<script>
export default {
  props: {
    item: {
      type: Object,
      required: true
    },
    selectedAuthors: {
      type: Array,
      required: true
    }
  },
  computed: {
    classes() {
      return {
        component: [
          this.$style.component,
          this.isCurrent ? this.$style['is-current'] : ''
        ]
      }
    },
    isCurrent() {
      return this.selectedAuthors.includes(this.item)
    }
  },
  methods: {
    selectAuthor() {
      // send to parent to evaluate duplicates of selected tags
      this.$emit('select-author', this.item)
    }
  }
}
</script>

<style lang="scss" module>
.component {
  // @extend %ff-sans;
  // @extend %fs-overlay;
  // @extend %button-reset;

  position: relative;
  display: inline;
  text-align: start;
  margin-left: var(--list-indent);

  &:not(:last-of-type) {
    margin-right: var(--gutter);
  }

  &::before {
    position: absolute;
    margin-right: var(--spacing-xsmall);
    margin-left: calc(var(--list-indent) * -1);
    color: var(--green-light);
    content: '\25CB ';
  }

  &.is-current {
    &::before {
      content: '\25CF ';
    }
  }
}
</style>
