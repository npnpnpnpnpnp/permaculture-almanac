<template>
  <main :class="$style.view" v-if="page.fields">
    <div :class="$style.text">
      <h2 :class="$style.title" v-html="page.fields.title" />
      <base-bodytext :text="page.fields.body" :class="$style.body" />
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

export default {
  components: {
    BaseBodytext,
    ReferenceItem
  },
  mixins: [metaInfo],
  data() {
    return {
      page: {}
    }
  },
  methods: {
    closeDetail() {
      this.$router.go(-1)
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
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

.title {
  @extend %fs-medium;
}

.text {
  @media (min-width: $small) {
    order: 1;
  }
}

.references {
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
  margin-top: calc(var(--blank-line) * 2);

  &::after {
    content: '\27f5';
  }

  @media (min-width: $medium) {
    display: flex;
    margin-top: 0;
  }
}
</style>
