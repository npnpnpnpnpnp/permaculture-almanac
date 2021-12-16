<template>
  <!-- <li :class="$style.component"> -->
  <a :href="item.meta.url" rel="noopener" :class="$style.link">
    <div
      v-if="item.fields.title"
      v-html="item.fields.title"
      :class="$style.title"
    />
    <ul v-if="item.fields.author">
      <author-item
        v-for="(author, index) in item.fields.author"
        :author="author"
        :key="`author-${index}`"
      />
    </ul>
    <ul v-if="item.fields.tags">
      <tag-item
        v-for="(tag, index) in item.fields.tags"
        :tag="tag"
        :key="`tag-${index}`"
      />
    </ul>
    <div v-html="item.meta.template" />
  </a>
  <!-- </li> -->
</template>

<script>
// import EventBus from '@/event-bus'
import AuthorItem from '@/components/author-item'
import TagItem from '@/components/tag-item'

export default {
  components: {
    AuthorItem,
    TagItem
  },
  props: {
    item: {
      type: Object,
      required: true,
      default: () => {}
    }
    // active: {
    //   type: Boolean,
    //   default: false
    // },
    // aspectRatio: {
    //   type: String,
    //   default: ''
    // },
    // controls: {
    //   type: Boolean,
    //   default: true
    // },
    // isScaling: {
    //   type: Boolean,
    //   default: true
    // },
    // stretching: {
    //   type: String,
    //   default: 'uniform'
    // }
    // isCurrent: {
    //   type: Boolean,
    //   required: true
    // }
  },
  data() {
    return {
      // scale: 1
    }
  },
  computed: {
    classes() {
      return {
        component: [
          this.$style.component
          // this.isFullBleed ? this.$style.isFullBleed : ''
        ]
      }
    }

    // isActive() {
    //   return this.isCurrent ? true : false
    // },
    // isFullBleed() {
    //   return this.item.full_bleed === 1 ? true : false
    // },
    // autostart() {
    //   return this.item.autoplay === 1 ? 'viewable' : 'false'
    // },
    // repeat() {
    //   return this.item.loop === 1 ? true : false
    // },
    // showFigure() {
    //   return this.item.number
    // },
    // scaled() {
    //   return this.isScaling
    //     ? { transform: 'translate(-50%, -50%) scale(' + this.scale + ')' }
    //     : ''
    // }
  },
  methods: {
    // contain() {
    //   const outer = this.$refs.component
    //   const inner = this.$refs.wrapper
    //   if (outer === undefined || inner === undefined) return
    //   const scale = Math.min(
    //     outer.offsetWidth / inner.offsetWidth,
    //     outer.offsetHeight / inner.offsetHeight
    //   )
    //   this.scale = scale
    // }
  },
  mounted() {
    // if (this.isScaling) {
    //   EventBus.$on('video-ready', () => {
    //     this.contain()
    //   })
    //   window.addEventListener('resize', this.contain)
    // }
  },
  beforeDestroy() {
    // window.removeEventListener('resize', this.contain)
  },
  watch: {
    // active() {
    //   if (this.isScaling && this.active) this.contain()
    // }
  }
}
</script>

<style lang="scss" module>
.component {
  // height: 100vh;
  // @media (min-width: $medium) {
  //   margin-right: var(--indent-vertical);
  //   margin-left: var(--indent-vertical);
  // }

  // @media (min-width: $large) {
  //   // padding: 0 calc(var(--gutter) * 2);
  //   margin-right: var(--text-indent-vertical);
  //   margin-left: var(--text-indent-vertical);
  // }

  // @media (min-width: $xxlarge) {
  //   margin-right: var(--text-indent-large);
  //   margin-left: var(--text-indent-large);
  // }

  // @media print {
  //   display: none;
  // }
}

.link {
  // display: inline-block;
  // width: 100%;
  display: grid;
  // based on: https://stackoverflow.com/questions/43311943/prevent-content-from-expanding-grid-items
  // and: https://stackoverflow.com/questions/52861086/why-does-minmax0-1fr-work-for-long-elements-while-1fr-doesnt
  // grid-template-rows: minmax(0, 1fr) auto;
  grid-template-columns: var(--resource-grid);
  // only works without overflow when using fr units
  // see: https://css-tricks.com/introduction-fr-css-unit/
  grid-gap: var(--gutter);
  width: 100%;
  // height: 100vh;
}

.title {
  hyphens: auto;
}

.wrapper {
  // display: flex;
  // align-items: center;
  // justify-content: center;
  // height: 100%;
  // padding: var(--slide-padding);

  // .isFullBleed & {
  //   padding: 0;
  // }
  // position: absolute;
  // top: 50%;
  // left: 50%;
  // width: 100%;
  // margin: 0;
}

// .video {
//   width: 100%;
//   height: inherit;

//   iframe {
//     width: inherit;
//     height: inherit;
//   }
// }

// .caption {
//   // @extend %fs-small;

//   position: absolute;
//   bottom: 0;
//   width: 100%;
//   padding: var(--gutter);
//   text-transform: uppercase;
// }
</style>
