<template>
  <main :class="$style.view" v-if="page.fields">
    <h2 :class="$style.title" v-html="page.fields.title" />
    <base-bodytext :text="page.fields.body" :class="$style.body" />
  </main>
</template>

<script>
import PageService from '@/services/page'

export default {
  components: {
    BaseBodytext: () => import('@/components/base-bodytext')
  },
  metaInfo() {
    return {
      title: this.page.fields ? this.page.fields.title : ''
    }
  },
  data() {
    return {
      page: {}
    }
  },
  async created() {
    this.page = await PageService.get({ id: this.$route.name })
  }
}
</script>

<style lang="scss" module>
// .view {}
// .title {}
// .body {}
</style>
