<template>
  <main :class="$style.view" v-if="page.fields">
    <h2 :class="$style.title" v-html="page.fields.title" />
    <repeater-matrix :items="page.children" />
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import RepeaterMatrix from '@/components/repeater-matrix'

export default {
  components: {
    RepeaterMatrix
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
