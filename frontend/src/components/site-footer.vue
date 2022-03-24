<template>
  <transition name="t-header" mode="out-in">
    <footer :class="$style.component" ref="header">
      <!-- v-if="isVisible"  -->
      <div :class="$style.buttons">
        <button type="button" @click="openImprint" :class="$style.button">
          {{ labels.imprint }}
        </button>
        <button type="button" @click="openPrivacy" :class="$style.button">
          {{ labels.privacy }}
        </button>
      </div>
    </footer>
  </transition>
</template>

<script>
// import EventBus from '@/event-bus'

export default {
  data() {
    return {
      isVisible: false,
      labels: {
        imprint: 'Impressum',
        privacy: 'Datenschutz'
      }
    }
  },
  computed: {
    isHome() {
      return this.$route.meta.template === 'home'
    }
  },
  methods: {
    openImprint() {
      this.$emit('imprint-visible', true)
    },
    openPrivacy() {
      this.$emit('privacy-visible', true)
    }
  },
  mounted() {
    // get page loaded event from home to show footer as soon as home is visible
    // if (this.isHome) {
    //   EventBus.$on('home-loaded', payload => {
    //     this.isVisible = payload
    //   })
    // } else {
    //   EventBus.$on('page-loaded', payload => {
    //     this.isVisible = payload
    //   })
    // }
  }
}
</script>

<style lang="scss" scoped>
.t-header-enter-active,
.t-header-leave-active {
  transition: opacity 450ms ease;
}

.t-header-enter,
.t-header-leave-to {
  opacity: 0;
}
</style>

<style lang="scss" module>
.component {
  position: fixed;
  bottom: 0;
  right: 0;
  width: 100vw;
  z-index: 1;
  padding: 0 var(--gutter) calc(var(--blank-line) * 1.5) var(--gutter);

  @media (min-width: $medium) {
    width: initial;
    padding: 0 var(--gutter) calc(var(--blank-line) * 1.25) var(--gutter);
  }

  @media (min-width: $large) {
    grid-template-columns: 25% auto;
  }
}

.buttons {
  display: flex;
  justify-content: center;

  @media (min-width: $medium) {
    display: inline-block;
    grid-column: 2 / 3;
    justify-self: flex-end;
  }
}

.button {
  @extend %button-reset;
  @extend %fs-small;

  @include focus-default($color: transparent);

  color: var(--green-light);

  &:not(:last-of-type) {
    margin-right: var(--gutter);
  }
}
// padding: var(--gutter) var(--gutter) calc(var(--gutter) * 2) var(--gutter);
// position: fixed;
// top: 0;
// background-color: var(--white);
// width: 100%;

// @media (min-width: $xsmall) {
//   display: grid;
//   grid-template-columns: repeat(2, 1fr);
//   grid-gap: calc(var(--gutter) * 1.5);
// }

// @media (min-width: $medium) {
//   grid-template-columns: 33.333% max-content auto;
//   padding: var(--gutter) var(--gutter) calc(var(--gutter) * 5) var(--gutter);
// }

// @media (min-width: $large) {
//   grid-template-columns: 25% max-content auto;
// }
</style>
