<template>
  <main :class="$style.view" v-if="page.fields" @click="navigate">
    <!-- <div :class="$style.wrapper"> -->
    <div :class="$style.wrapper">
      <div v-html="page.fields.title" :class="$style.title" />
      <!-- <div v-html="truncateTitle.title1" :class="$style.title1" />
        <div v-html="truncateTitle.title2" :class="$style.title2" />
        <div v-html="truncateTitle.title3" :class="$style.title3" /> -->
      <div v-html="page.fields.subtitle" :class="$style.subtitle" />
    </div>
    <!-- <vue-typer
        :class="$style.subtitle"
        :text="page.fields.subtitle"
        :repeat="options.repeat"
        :pre-type-delay="options.preTypeDelay"
        :type-delay="options.typeDelay"
        :caret-animation="options.caretAnimation"
      ></vue-typer> -->
    <!-- </div> -->
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import EventBus from '@/event-bus'

export default {
  mixins: [metaInfo],
  data() {
    return {
      page: {},
      loading: true,
      options: {
        preTypeDelay: 1000, // time before typing starts
        typeDelay: 60,
        caretAnimation: 'blink',
        repeat: 0
      }
    }
  },
  computed: {
    // truncateTitle() {
    //   const title1 = this.page.fields.title.slice(0, 5)
    //   const title2 = this.page.fields.title.slice(5, 12)
    //   const title3 = this.page.fields.title.split(' ')
    //   return {
    //     title1: title1,
    //     title2: title2,
    //     title3: title3[1]
    //   }
    // }
  },
  methods: {
    navigate() {
      // setTimeout(() => {
      this.$router.replace('/resources')
      // }, 10000)
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
    this.loading = false
  },
  watch: {
    loading() {
      if (!this.loading) {
        EventBus.$emit('home-loaded', true)
      }
    }
  }
}
</script>

<style lang="scss" module>
.view {
  padding: var(--gutter);
  height: 100%;
  width: 100%;
  cursor: pointer;
  // background-color: var(--green-light);
  // background: linear-gradient(
  //   to right,
  //   rgba(255, 255, 255, 0),
  //   var(--green-light-alpha) 50%
  // );

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

.title {
  @extend %fs-mlarge;
  @extend %fw-bold;

  // background: linear-gradient(
  //   to left,
  //   rgba(255, 255, 255, 0),
  //   var(--green-light-alpha) 50%
  // );
  // padding: var(--gutter);
  // border-radius: 0.5rem;
  // display: flex;
  // flex-direction: column;
  // justify-content: center;
  // align-items: center;
  // z-index: 1;
  // position: absolute;
  // top: 50%;
  // left: 50%;
  // transform: translate(-50%, -50%);
  text-align: center;
  text-transform: uppercase;
  letter-spacing: 0.245em;
  max-width: 12em;
  color: var(--green-light);

  // transition: opacity 1s, mix-blend-mode 1s;

  // &:hover {
  //   z-index: 0;
  //   opacity: 0.2;
  //   // mix-blend-mode: multiply;

  //   + .subtitle {
  //     color: var(--grey-dark);
  //   }
  // }
}

.title1,
.title2,
.title3 {
  @extend %fs-xlarge;

  display: inline-block;
  text-transform: uppercase;
  // letter-spacing: var(--letter-spacing-large);
  color: var(--green-light);
  // line-height: 0.6em;

  // &:hover {
  //   opacity: 0.3;
  // }
}

.title2 {
  // padding-left: var(--gutter);
  // margin-left: var(--gutter);
  // background: linear-gradient(
  //   to left,
  //   rgba(255, 255, 255, 0),
  //   var(--green-light-alpha) 50%
  // );
  border-radius: 0.5rem;
  // align-self: flex-end;
}

.subtitle {
  @extend %fs-medium;
  @extend %base-bodytext;
  @extend %fw-bold;

  color: var(--green-light);

  // font-family: 'Times', serif;
  max-width: 18em;
  // text-align: center;
  // margin-top: calc(var(--blank-line) * 3);
  // min-height: calc(var(--blank-line) * 2);
  // word-break: break-word;
  hyphens: auto;
  margin-top: calc(var(--blank-line) * 2);
  // line-height: 0.843em;
  // text-align-last: right;
  // color: var(--grey-light);
  transition: color 1s;
  text-align: center;
}

// :global(.vue-typer) {
//   :global(.custom.char) {
//     color: var(--green-light);
//   }
// }
</style>
