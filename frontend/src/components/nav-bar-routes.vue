<script>
import BaseLink from '@/components/base-link'

export default {
  components: { BaseLink },
  functional: true,
  props: {
    routes: {
      type: Array,
      required: true
    }
  },
  render(h, { props, $style = {} }) {
    function getRouteTitle(route) {
      return typeof route.title === 'function' ? route.title() : route.title
    }

    return props.routes.map(route => (
      <BaseLink
        tag="li"
        key={route.name}
        to={route}
        exact-active-class={$style.active}
      >
        <a>{getRouteTitle(route)}</a>
      </BaseLink>
    ))
  }
}
</script>

<style lang="scss" module>
.active a {
  cursor: default;
}
</style>
