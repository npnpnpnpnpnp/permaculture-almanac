<template>
  <button
    type="button"
    v-html="item"
    :class="classes.component"
    @click="selectCategory"
  />
</template>

<script>
export default {
  props: {
    item: {
      type: String,
      required: true
    },
    selectedCategories: {
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
      return this.selectedCategories.includes(this.item)
    }
  },
  methods: {
    selectCategory() {
      this.$emit('select-category', this.item)
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
  display: block;
  text-align: start;
  margin-left: var(--list-indent);

  &:not(:last-of-type) {
    margin-right: var(--gutter);
  }

  &::before {
    // @extend %ff-symbols;

    position: absolute;
    margin-right: var(--spacing-xsmall);
    margin-left: calc(var(--list-indent) * -1);
    margin-top: -0.08em;
    content: '\25CC ';
  }

  &.is-current {
    &::before {
      content: '\25CF ';
    }
  }

  @media (min-width: $medium) {
    display: inline;
  }
}
</style>
