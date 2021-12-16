<template>
  <main :class="$style.view" v-if="page.fields">
    <h2 :class="$style.title" v-html="page.fields.title" />
    <base-bodytext :text="page.fields.body" :class="$style.body" />
    <a :href="page.fields.external_url">
      <span v-html="page.fields.external_url_title" />
    </a>
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import BaseBodytext from '@/components/base-bodytext'

export default {
  components: {
    BaseBodytext
  },
  mixins: [metaInfo],
  data() {
    return {
      page: {}
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
  }
}
</script>

<style lang="scss" module>
// .view {}
// .title {}
// .body {}
</style>
