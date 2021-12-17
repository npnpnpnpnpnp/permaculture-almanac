<template>
  <div v-if="showItem" :class="$style.component">
    <ul :class="$style.list">
      <indicator-item
        v-for="(item, index) in filteredItems"
        :key="`item-${index}`"
        :item="item"
      />
      <li :class="$style.button">
        <button @click="openFilter">{{ labels.openFilter }}</button>
      </li>
    </ul>
  </div>
</template>

<script>
import IndicatorItem from '@/components/indicator-item'
import { mapState } from 'vuex'

export default {
  components: {
    IndicatorItem
  },
  props: {
    filter: {
      type: Object,
      required: true
    },
    filterVisible: {
      type: Boolean,
      required: true
    }
  },
  data() {
    return {
      labels: {
        openFilter: 'show all'
      }
    }
  },
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
    filteredItems() {
      return [
        ...this.filter.selectedCategories,
        ...this.filter.selectedTags,
        ...this.filter.selectedAuthors
      ]
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
  },
  methods: {
    // get category from child and push it into collective array of selected category filter
    applyFilter(category) {
      const categoryExists = this.selectedCategories.includes(category)
      // removes filter when it exists on click in child
      if (categoryExists) {
        // delete the currently clicked element from array which leads to deselection of filter
        const index = this.selectedCategories.indexOf(category)
        this.selectedCategories.splice(index, 1)
      }
      // add filter if it’s not already selected
      if (!categoryExists) {
        this.selectedCategories.push(category)
      }
    },
    openFilter() {
      this.$emit('filter-visibility', true)
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
  max-height: calc(var(--blank-line) * 3);

  &::after {
    content: '';
    text-align: right;
    position: absolute;
    bottom: 0;
    right: 0;
    width: 30%;
    // height: calc(var(--blank-line) * 1.5);
    height: var(--blank-line);
    background: linear-gradient(
      to right,
      rgba(255, 255, 255, 0),
      rgba(255, 255, 255, 1) 50%
    );
    // background-image: linear-gradient(
    //   to bottom,
    //   rgba(255, 255, 255, 0),
    //   white 100%
    // );
  }
}

.button {
  position: absolute;
  right: 0;
  bottom: 0;
  z-index: 1;
}
</style>
