<template>
  <div :class="$style.component">
    <div>title</div>
    <div>author</div>
    <div>tags</div>
  </div>
</template>

<script>
export default {
  // components: {},
  computed: {
    classes() {
      return {}
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
