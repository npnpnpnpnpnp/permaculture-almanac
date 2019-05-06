<template>
  <main :class="$style.view">
    <h2 :class="$style.title" v-html="page.title" />
    <BaseBodytext :text="page.body" :class="$style.body" />
  </main>
</template>

<script>
import BaseBodytext from '@/components/base-bodytext'
import axios from 'axios'

export default {
  components: { BaseBodytext },
  data() {
    return {
      page: [],
      loading: false,
      error: null
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
