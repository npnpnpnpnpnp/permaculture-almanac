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
      loading: false,
      error: null
    }
  },
  computed: {
    pageTitle() {
      return this.$route.meta.title
    }
  },
  methods: {
    fetchData() {
      this.page = []
      this.loading = true
      this.error = null
      axios
        .get(`page/${this.$route.meta.id}`)
        .then(response => {
          this.page = response.data
          this.loading = false
        })
        .catch(error => {
          console.log(error)
        })
    }
  },
  created() {
    this.fetchData()
  }
}
</script>

<style lang="scss" module>
//.view {}
//.title {}
//.body {}
</style>
