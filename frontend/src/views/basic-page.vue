<template>
  <main :class="$style.view">
    <h2 :class="$style.title">{{ pageTitle }}</h2>
    <div :class="$style.body" @click="delegateLinks" v-html="page.body"></div>
  </main>
</template>

<script>
import { delegateLinks } from '@/mixins/delegate-links'
import axios from 'axios'

export default {
  mixins: [delegateLinks],
  data() {
    return {
      page: [],
      error: null
    }
  },
  computed: {
    pageTitle() {
      return this.$route.meta.title
    }
  },
  methods: {
    setData(response) {
      this.page = response.data
    },
    handleError(error) {
      console.log(error)
    }
  },
  // Based on https://router.vuejs.org/guide/advanced/data-fetching.html#fetching-before-navigation
  beforeRouteEnter(to, from, next) {
    axios
      .get(`page/${to.meta.id}`)
      .then(response => {
        next(vm => vm.setData(response))
      })
      .catch(error => {
        next(vm => vm.handleError(error))
      })
  },
  beforeRouteUpdate(to, from, next) {
    this.page = []
    axios
      .get(`page/${to.meta.id}`)
      .then(response => {
        this.setData(response)
        next()
      })
      .catch(error => {
        this.handleError(error)
        next()
      })
  }
}
</script>

<style lang="scss" module>
//.view {}
//.title {}
//.body {}
</style>
