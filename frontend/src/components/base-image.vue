<template>
  <img
    v-if="resizeImage"
    @load="onLoaded"
    :sizes="sizes"
    :srcset="srcset()"
    :alt="image.description"
    :class="imgClass"
  />
  <img
    v-else
    @load="onLoaded"
    :src="image.urls[0].url"
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
    },
    sizes: {
      type: String,
      default: '100vw'
    }
  },
  data() {
    return {
      loaded: false
    }
  },
  computed: {
    isPortrait() {
      return this.image.ratio < 1 ? true : false
    },
    imgClass() {
      return [
        this.$style.component,
        this.loaded ? 'is-loaded' : '',
        this.isPortrait ? 'is-portrait' : ''
      ]
    },
    resizeImage() {
      return this.image.ext !== 'svg'
    }
  },
  methods: {
    onLoaded() {
      this.loaded = true
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

<style lang="scss" module>
.component {
  opacity: 0;
  transition: opacity 150ms ease;

  &:global(.is-loaded) {
    opacity: 1;
  }
}
</style>
