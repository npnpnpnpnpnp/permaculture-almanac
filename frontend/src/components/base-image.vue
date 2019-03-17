<template>
  <img
    :sizes="sizes()"
    :srcset="srcset()"
    :alt="image.description"
    :class="imgClass"
  />
</template>

<script>
export default {
  inheritAttrs: false,
  props: {
    image: {
      type: Object,
      required: true
      //default: () => {}
    }
  },
  computed: {
    isPortrait() {
      return this.image.ratio > 1 ? true : false
    },
    imgClass() {
      return this.isPortrait ? 'is-portrait' : ''
    }
  },
  methods: {
    sizes() {
      // TODO: sizes should be set by the layout and not this generic component
      let sizes = '100vw'
      if (this.isPortrait) {
        sizes = '75vw'
      }
      return sizes
    },
    srcset() {
      let response = ''
      Object.values(this.image.urls).forEach(url => {
        response += `${url.url} ${url.width}w,`
      })
      response = response.slice(',', -1)
      return response
    }
  }
}
</script>
