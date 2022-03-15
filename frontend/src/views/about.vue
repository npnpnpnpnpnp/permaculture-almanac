<template>
  <main :class="$style.view" v-if="page.fields" :style="spacingTop">
    <base-bodytext :text="page.fields.body" :class="$style.body" />
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import BaseBodytext from '@/components/base-bodytext'
import EventBus from '@/event-bus'
import { mapState } from 'vuex'

export default {
  components: {
    BaseBodytext
  },
  mixins: [metaInfo],
  data() {
    return {
      page: {},
      labels: {
        imprint: 'Impressum',
        privacy: 'Datenschutz'
      }
    }
  },
  computed: {
    ...mapState(['headerHeight']),
    spacingTop() {
      return {
        paddingTop: this.headerHeight + 'px'
      }
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
    EventBus.$emit('page-loaded')
  }
}
</script>

<style lang="scss" module>
.view {
  // position: absolute;
  // top: 0;
  // width: 100%;
  // height: 100%;
  padding: var(--gutter);
  background-color: var(--white);
  // min-height: 100%;
  flex: 1;

  &:last-child {
    margin-bottom: calc(var(--blank-line) * 3);
  }

  @media (min-width: $medium) {
    display: grid;
    align-items: flex-start;
    grid-template-columns: 33.333% auto;
    grid-gap: calc(var(--gutter) * 1.5);
  }

  @media (min-width: $large) {
    grid-template-columns: 25% auto;
  }
}

.body {
  @extend %base-bodytext;

  grid-column: 2;
  max-width: 25em;

  @media (min-width: $medium) {
    max-width: 40em;
  }
}
</style>
