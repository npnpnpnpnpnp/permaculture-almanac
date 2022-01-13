<template>
  <main :class="$style.view" v-if="page.fields">
    <div :class="$style.wrapper">
      <div :class="$style.titles">
        <div v-html="truncateTitle.title1" :class="$style.title1" />
        <div v-html="truncateTitle.title2" :class="$style.title2" />
        <div v-html="truncateTitle.title3" :class="$style.title3" />
      </div>
      <vue-typer
        :class="$style.subtitle"
        :text="page.fields.subtitle"
        :repeat="options.repeat"
        :pre-type-delay="options.preTypeDelay"
        :type-delay="options.typeDelay"
        :caret-animation="options.caretAnimation"
      ></vue-typer>
      <!-- <div v-html="page.fields.subtitle" :class="$style.subtitle" /> -->
    </div>
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'

export default {
  mixins: [metaInfo],
  data() {
    return {
      page: {},
      options: {
        preTypeDelay: 1000, // time before typing starts
        typeDelay: 60,
        caretAnimation: 'blink',
        repeat: 0
      }
    }
  },
  computed: {
    truncateTitle() {
      const title1 = this.page.fields.title.slice(0, 5)
      const title2 = this.page.fields.title.slice(5, 12)
      const title3 = this.page.fields.title.split(' ')
      return {
        title1: title1,
        title2: title2,
        title3: title3[1]
      }
    }
  },
  methods: {
    navigate() {
      setTimeout(() => {
        this.$router.replace('/resources')
      }, 10000)
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
  },
  mounted() {
    // this.navigate()
  }
}
</script>

<style lang="scss" module>
.view {
  padding: var(--gutter);
  position: absolute;
  top: 0;
  height: 100%;
  width: 100%;
  background: linear-gradient(
    to right,
    rgba(255, 255, 255, 0),
    var(--green-light-alpha) 50%
  );

  // @media (min-width: $medium) {
  //   display: grid;
  //   align-items: flex-start;
  //   grid-template-columns: 33.333% auto;
  //   grid-gap: calc(var(--gutter) * 1.5);
  // }

  // @media (min-width: $large) {
  //   grid-template-columns: 25% auto;
  // }
}

.wrapper {
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.titles {
  // background: linear-gradient(
  //   to left,
  //   rgba(255, 255, 255, 0),
  //   var(--green-light-alpha) 50%
  // );
  padding: var(--gutter);
  border-radius: 0.5rem;
}

.title1,
.title2,
.title3 {
  @extend %fs-xlarge;
  @extend %fw-bold;

  text-transform: uppercase;
  letter-spacing: var(--letter-spacing-large);
  color: var(--green-light);
}

.title2 {
  padding-left: var(--gutter);
  margin-left: var(--gutter);
  // background: linear-gradient(
  //   to left,
  //   rgba(255, 255, 255, 0),
  //   var(--green-light-alpha) 50%
  // );
  border-radius: 0.5rem;
}

.subtitle {
  @extend %base-bodytext;
  @extend %fw-bold;

  max-width: 29em;
  text-align: center;
  margin-top: calc(var(--blank-line) * 3);
  min-height: calc(var(--blank-line) * 2);
  word-break: break-word;
}

:global(.vue-typer) {
  :global(.custom.char) {
    color: var(--green-light);
  }
}
</style>
