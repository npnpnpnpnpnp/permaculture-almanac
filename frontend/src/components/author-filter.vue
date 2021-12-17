<template>
  <div :class="$style.component">
    <div v-html="labels.title" :class="$style.title" />
    <div :class="classes.content">
      <author-filter-item
        v-for="(item, index) in defaultAuthors"
        :key="`item-${index}`"
        :item="item"
        :selected-authors="selectedAuthors"
        @select-author="applyFilter"
      />
    </div>
  </div>
</template>

<script>
import AuthorFilterItem from '@/components/author-filter-item'
import { mapState } from 'vuex'

export default {
  components: {
    AuthorFilterItem
  },
  props: {
    defaultAuthors: {
      type: Array,
      required: true
    },
    selectedAuthors: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      labels: {
        title: 'Authors',
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
      return this.selectedAuthors.length > 0
    }
  },
  methods: {
    // get category from child and push it into collective array of selected category filter
    applyFilter(author) {
      const authorExists = this.selectedAuthors.includes(author)

      // removes filter when it exists on click in child
      if (authorExists) {
        // delete the currently clicked element from array which leads to deselection of filter
        const index = this.selectedAuthors.indexOf(author)
        this.selectedAuthors.splice(index, 1)
      }

      // add filter if it’s not already selected
      if (!authorExists) {
        this.selectedAuthors.push(author)
      }
    },
    // reset locally, watcher emits to parent
    resetFilter() {
      this.selectedAuthors = []
    },
    toggleFilter() {
      this.$store.dispatch('setFilterVisibility')
    }
  },
  watch: {
    selectedAuthors() {
      // whenever this.selectedTags is updated, emit to parent, pass down via prop to child to handle selected category design
      this.$emit('update-authors', this.selectedAuthors)
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
