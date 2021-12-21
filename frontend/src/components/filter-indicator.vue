<template>
  <div v-if="showItem" :class="$style.component">
    <ul :class="$style.list">
      <portal-target name="category-portal" :class="$style.portal" />
      <portal-target name="tag-portal" :class="$style.portal" />
      <portal-target name="author-portal" :class="$style.portal" />
    </ul>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  props: {
    filter: {
      type: Object,
      required: true
    }
  },
  // data() {
  //   return {}
  // },
  computed: {
    ...mapState(['isDesktop']),
    classes() {
      return {
        content: [
          this.$style.components,
          this.filterVisible ? '' : this.$style['is-visible']
        ]
      }
    },
    hasFilterApplied() {
      if (Object.keys(this.filter).length === 0) return false
      return (
        this.filter.selectedTags.length > 0 ||
        this.filter.selectedCategories.length > 0 ||
        this.filter.selectedAuthors.length > 0
      )
    },
    showItem() {
      return !this.filterVisible && this.hasFilterApplied && !this.isDesktop
    }
  }
}
</script>

<style lang="scss" module>
.component {
  margin-bottom: var(--filter-spacing-bottom);
}

.list {
  position: relative;
  overflow: hidden;
  // based on: https://css-tricks.com/line-clampin/
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  max-height: calc(var(--blank-line) * 4.5);
  margin-left: calc(var(--gutter) * -1);

  // &::after {
  //   content: '';
  //   text-align: right;
  //   position: absolute;
  //   bottom: 0;
  //   right: 0;
  //   width: 30%;
  //   // height: calc(var(--blank-line) * 1.5);
  //   height: var(--blank-line);
  //   background: linear-gradient(
  //     to right,
  //     rgba(255, 255, 255, 0),
  //     rgba(255, 255, 255, 1) 50%
  //   );
  //   // background-image: linear-gradient(
  //   //   to bottom,
  //   //   rgba(255, 255, 255, 0),
  //   //   white 100%
  //   // );
  // }
}

// .button {
//   position: absolute;
//   right: 0;
//   bottom: 0;
//   z-index: 1;
// }

.portal {
  display: inline-block;
}
</style>
