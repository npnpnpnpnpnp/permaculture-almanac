<template>
  <main :class="$style.view" v-if="page.fields" :style="spacingTop">
    <div :class="$style.text">
      <h2 :class="$style.title" v-html="page.fields.title" />
      <base-bodytext :text="page.fields.body" :class="$style.body" />
      <div v-html="labels.referenceTitle" :class="$style.referenceTitle" />
      <ul :class="$style.references">
        <reference-item
          v-for="(reference, index) in page.references"
          :key="`reference-${index}`"
          :reference="reference"
        />
      </ul>
    </div>
    <button type="button" :class="$style.button" @click="closeDetail" />
    <!-- <a :href="page.fields.external_url">
      <span v-html="page.fields.external_url_title" />
    </a> -->
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import BaseBodytext from '@/components/base-bodytext'
import ReferenceItem from '@/components/reference-item'
import { mapState } from 'vuex'
import EventBus from '@/event-bus'

export default {
  components: {
    BaseBodytext,
    ReferenceItem
  },
  mixins: [metaInfo],
  data() {
    return {
      page: {},
      labels: {
        referenceTitle: 'References'
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
  methods: {
    closeDetail() {
      this.$router.go(-1)
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
    grid-template-columns: 33.333% auto;
    grid-gap: calc(var(--gutter) * 1.5);
  }

  @media (min-width: $large) {
    grid-template-columns: 25% auto;
  }
}

.title {
  @extend %fs-medium;
}

.text {
  @media (min-width: $small) {
    order: 1;
    grid-column: 2 / 3;
  }
}

.referenceTitle {
  @extend %fw-bold;

  color: var(--green-light);
  margin: calc(var(--blank-line) * 3) 0 var(--blank-line) 0;
}

.references {
  margin-top: var(--blank-line);

  @media (min-width: $medium) {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap: var(--gutter);
  }
}

.body {
  @extend %base-bodytext;
  margin-top: calc(var(--blank-line) * 1.5);
  max-width: 25em;

  @media (min-width: $medium) {
    max-width: 40em;
  }
}

.button {
  @include focus-default($color: transparent);

  margin-top: calc(var(--blank-line) * 2);

  &::after {
    content: '\27f5';
  }

  @media (min-width: $medium) {
    position: fixed;
    display: flex;
    margin-top: 0;
  }
}
</style>
