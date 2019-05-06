<template>
  <img
    v-if="resizeImage"
    :sizes="sizes"
    :srcset="srcset()"
    :alt="image.description"
    :class="imgClass"
  />
  <img
    v-else
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
  computed: {
    isPortrait() {
      return this.image.ratio < 1 ? true : false
    },
    imgClass() {
      return this.isPortrait ? 'is-portrait' : ''
    },
    resizeImage() {
      return this.image.ext !== 'svg'
    }
  },
  methods: {
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
