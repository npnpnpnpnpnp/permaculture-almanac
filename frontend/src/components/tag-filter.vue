<template>
  <div :class="$style.component">
    <div v-html="labels.title" :class="$style.title" />
    <div :class="classes.content">
      <tag-filter-item
        v-for="(item, index) in defaultTags"
        :key="`item-${index}`"
        :item="item"
        :selected-tags="selectedTags"
        @select-tag="applyFilter"
      />
    </div>
  </div>
</template>

<script>
import TagFilterItem from '@/components/tag-filter-item'
import { mapState } from 'vuex'

export default {
  components: {
    TagFilterItem
  },
  props: {
    defaultTags: {
      type: Array,
      required: true
    },
    selectedTags: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      labels: {
        title: 'Tags',
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
    }
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
  margin-bottom: var(--filter-spacing-bottom);
}

.title {
  margin-bottom: var(--blank-line);
}
</style>
