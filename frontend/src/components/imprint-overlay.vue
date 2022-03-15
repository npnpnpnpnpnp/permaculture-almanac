<template>
  <transition name="t-view">
    <section v-if="isVisible" :class="$style.component" :style="spacingTop">
      <base-bodytext :text="imprint" :class="$style.imprint" />
      <div>
        <button type="button" :class="$style.button" @click="closeImprint" />
      </div>
    </section>
  </transition>
</template>

<script>
import { mapState } from 'vuex'
import BaseBodytext from '@/components/base-bodytext'

export default {
  components: { BaseBodytext },
  props: {
    isVisible: {
      type: Boolean,
      required: true
    }
  },
  computed: {
    ...mapState(['headerHeight', 'imprint']),
    isHome() {
      return this.$route.meta.template === 'home'
    },
    spacingTop() {
      let padding = this.isHome ? 7 + 'em' : this.headerHeight + 'px'
      return {
        paddingTop: padding
      }
    }
  },
  methods: {
    closeImprint() {
      this.$emit('imprint-visible', false)
    }
  }
}
</script>

<style lang="scss" scoped>
@include t-fade('t-view');
</style>

<style lang="scss" module>
.component {
  position: fixed;
  top: 0;
  left: 0;
  padding: 0 var(--gutter) var(--gutter) var(--gutter);
  width: 100%;
  height: 100%;
  z-index: 2;
  background-color: var(--white);
  overflow: auto;

  @media (min-width: $medium) {
    display: grid;
    // align-items: flex-start;
    grid-template-columns: 33.333% auto;
    grid-gap: calc(var(--gutter) * 1.5);
    padding: 0 var(--gutter) calc(var(--blank-line) * 2) var(--gutter);
  }

  @media (min-width: $large) {
    grid-template-columns: 25% auto;
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

.imprint {
  @extend %base-bodytext;

  max-width: 25em;

  @media (min-width: $small) {
    order: 1;
  }

  @media (min-width: $medium) {
    max-width: 40em;
  }
}
// .is-active {}
</style>
