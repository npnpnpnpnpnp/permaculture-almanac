<template>
  <div :class="$style.component" @click="selectCategory">
    <div v-html="item.fields.title" :class="$style.category" />
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
    selectCategory() {
      this.$emit('select-category', this.item)
    }
  }
}
</script>

<style lang="scss" module>
.component {
  display: inline-block;
  // &::after {
  //   content: '\00d7';
  //   margin-left: var(--spacing-xsmall);
  // }
}
</style>
