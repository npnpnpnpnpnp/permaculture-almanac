<template>
  <div :class="$style.component">
    <label v-html="labels.name" />
    <div :class="classes.content">
      <tag-filter-item
        v-for="(item, index) in defaultTags"
        :key="`item-${index}`"
        :item="item"
        :selected-tags="selectedTags"
        @select-tag="applyFilter"
      />
      <!-- <button
        v-if="hasFilterApplied"
        type="button"
        :class="$style.delete"
        @click="resetFilter"
      >
        {{ labels.deleteFilter }}
      </button> -->
    </div>
  </div>
</template>

<script>
import TagFilterItem from '@/components/tag-filter-item'
import { mapState } from 'vuex'
// import EventBus from '@/event-bus'

export default {
  components: {
    TagFilterItem
  },
  props: {
    defaultTags: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      selectedTags: [],
      labels: {
        name: 'Tags',
        openFilter: 'Filter',
        deleteFilter: 'Filter löschen'
      }
    }
  },
  computed: {
    ...mapState(['filterVisible']),
    classes() {
      return {
        content: [
          this.$style.content,
          this.filterVisible ? this.$style['is-visible'] : ''
        ],
        toggle: [
          this.$style.toggle,
          this.hasFilterApplied ? this.$style['is-active'] : ''
        ]
      }
    },
    hasFilterApplied() {
      return this.selectedTags.length > 0
    }
    // findIndices() {
    //   let indices = []
    //   this.filter.forEach(filterItem => {
    //     this.originalTags.forEach(originalTag => {
    //       const tagExists = originalTag.fields.title.includes(filterItem.title)

    //       if (tagExists) {
    //         const index = this.originalTags.indexOf(originalTag)
    //         indices.push({ index: index, filter: filterItem })
    //       } else return
    //     })
    //   })
    //   return indices
    // },
    // sortTags() {
    //   let sorted = this.findIndices
    //   sorted.sort(function(a, b) {
    //     return parseFloat(a.index) - parseFloat(b.index)
    //   })
    //   return sorted
    // }
  },
  methods: {
    // get category from child and push it into collective array of selected category filter
    applyFilter(tag) {
      const tagExists = this.selectedTags.includes(tag)

      // removes filter when it exists on click in child
      if (tagExists) {
        // delete the currently clicked element from array which leads to deselection of filter
        const index = this.selectedTags.indexOf(tag)
        this.selectedTags.splice(index, 1)
      }

      // add filter if it’s not already selected
      if (!tagExists) {
        this.selectedTags.push(tag)
      }
    },
    // reset locally, watcher emits to parent
    resetFilter() {
      this.selectedTags = []
    },
    toggleFilter() {
      this.$store.dispatch('setFilterVisibility')
    }
  },
  watch: {
    selectedTags() {
      // whenever this.selectedTags is updated, emit to parent, pass down via prop to child to handle selected category design
      this.$emit('update-tags', this.selectedTags)
    }
  }
}
</script>

<style lang="scss" module>
.component {
  position: sticky;
  z-index: 2;
  left: 0;
  height: 100%;
  top: calc(100vh - var(--gutter) * 5);

  @media (min-width: $medium) {
    width: 33.333%;
    padding-left: var(--gutter);
    top: calc(var(--gutter) * 9);
  }

  @media (min-width: $xlarge) {
    top: calc(var(--gutter) * 10);
  }

  // @media (min-width: $xxxlarge) {
  //   width: 28%;
  // }
}

.content {
  display: none;

  @media (max-width: $medium) {
    &.is-visible {
      position: fixed;
      top: 0;
      left: 0;
      display: block;
      width: 100%;
      height: 100%;
      padding: calc(var(--gutter) / 2);
      background-color: var(--white-alpha); // don't use shorthand property
    }

    @media (min-width: $medium) {
      padding: var(--gutter);
    }
  }

  @media (min-width: $medium) {
    display: block;
  }
}

.delete {
  // @extend %ff-sans;
  // @extend %fs-overlay;
  // @extend %button-reset;

  display: block;
  margin-top: var(--blank-line);

  &::before {
    // @extend %ff-symbols;

    margin-right: var(--spacing-xsmall);
    content: '\2573';
  }
}

.toggle {
  position: relative;
  left: 50%;
  padding: calc(var(--gutter) / 2) var(--gutter);
  color: var(--grey);
  background: var(--white);
  // border: 1px solid var(--black);
  border-radius: calc(var(--gutter) / 2);
  box-shadow: 2px 2px calc(var(--gutter) / 4) var(--grey-alpha);
  transform: translateX(-50%);

  &:focus {
    background-color: var(--white);
  }

  &.is-active {
    color: var(--black);
  }

  @media (min-width: $medium) {
    display: none;
  }
}
</style>
