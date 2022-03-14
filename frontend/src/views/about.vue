<template>
  <main :class="$style.view" v-if="page.fields" :style="spacingTop">
    <base-bodytext :text="page.fields.body" :class="$style.body" />
    <section :class="$style.imprint">
      <button
        v-html="labels.imprint"
        @click="toggleImprint"
        :class="classes.button"
      />
      <div
        v-if="imprintVisible"
        v-html="page.fields.imprint"
        :class="$style.content"
      />
    </section>
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
        imprint: 'Impressum'
      },
      imprintVisible: false
    }
  },
  computed: {
    ...mapState(['headerHeight']),
    classes() {
      return {
        button: [
          this.$style.button,
          this.imprintVisible ? this.$style.isVisible : ''
        ]
      }
    },
    spacingTop() {
      return {
        paddingTop: this.headerHeight + 'px'
      }
    }
  },
  methods: {
    toggleImprint() {
      this.imprintVisible = !this.imprintVisible
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

.imprint {
  margin: calc(var(--blank-line) * 2) 0 calc(var(--blank-line) * 3) 0;
}

.button {
  @include focus-default($color: transparent);
  // @extend %hover-default;

  &:before {
    margin-right: calc(var(--gutter) / 2);
    content: '\2193';
    // color: var(--green-light);
  }

  &.isVisible {
    &:before {
      content: '\2191';
    }
  }
}

.content {
  margin-top: var(--blank-line);
}

.imprint,
.body {
  @extend %base-bodytext;

  grid-column: 2;
  max-width: 25em;

  @media (min-width: $medium) {
    max-width: 40em;
  }
}
</style>
