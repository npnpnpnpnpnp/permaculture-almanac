<template>
  <main :class="$style.view" v-if="page.fields" :style="spacingTop">
    <base-bodytext :text="page.fields.body" :class="$style.body" />
    <section :class="$style.imprint">
      <button v-html="labels.imprint" :class="classes.button" />
      <!-- @click="toggleImprint" -->
      <base-bodytext :text="page.fields.imprint" :class="$style.content" />
      <!-- v-if="imprintVisible" -->
    </section>
    <section :class="$style.privacy">
      <button v-html="labels.privacy" :class="classes.button" />
      <!-- @click="togglePrivacy" -->
      <base-bodytext :text="page.fields.privacy" :class="$style.content" />
      <!-- v-if="privacyVisible" -->
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
        imprint: 'Impressum',
        privacy: 'Datenschutz'
      },
      imprintVisible: false,
      privacyVisible: false,
      isVisible: false
    }
  },
  computed: {
    ...mapState(['headerHeight']),
    classes() {
      return {
        button: [
          this.$style.button,
          this.imprintVisible ? this.$style.imprintVisible : '',
          this.privacyVisible ? this.$style.privacyVisible : ''
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
      if (this.privacyVisible) this.privacyVisible = false
      this.imprintVisible = !this.imprintVisible
    },
    togglePrivacy() {
      if (this.imprintVisible) this.imprintVisible = false
      this.privacyVisible = !this.privacyVisible
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

.imprint,
.privacy {
  margin-top: calc(var(--blank-line) * 2);
}

.button {
  @include focus-default($color: transparent);
  @extend %fw-bold;
  // @extend %hover-default;

  // &:before {
  //   margin-right: calc(var(--gutter) / 2);
  //   content: '\2193';
  //   // color: var(--green-light);
  // }

  // &.privacyVisible,
  // &.imprintVisible {
  //   &:before {
  //     content: '\2191';
  //   }
  // }
}

.content {
  margin-top: var(--blank-line);
}

.imprint,
.body,
.privacy {
  @extend %base-bodytext;

  grid-column: 2;
  max-width: 25em;

  @media (min-width: $medium) {
    max-width: 40em;
  }
}
</style>
