<template>
  <Layout>
    <h1>{{ pageTitle }}</h1>
  </Layout>
</template>

<script>
import Layout from '@/layouts/default'
import { mapState } from 'vuex'

export default {
  components: { Layout },
  computed: {
    ...mapState(['pageTitle'])
  }
}
</script>
