<template>
  <li :class="$style.component">
    <router-link
      :to="route.meta.url"
      :class="$style.link"
      :exact-active-class="$style['is-active']"
    >
      {{ route.meta.title }}
    </router-link>
  </li>
</template>

<script>
export default {
  props: {
    route: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" module>
.component {
  &:not(:last-of-type) {
    padding-right: var(--gutter);
  }
}

.link {
  @extend %link-reset;
}

// .is-active {}
</style>
