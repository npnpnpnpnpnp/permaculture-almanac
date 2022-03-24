<template>
  <div :class="$style.component">
    <div v-html="labels.title" :class="$style.title" />
    <author-filter-item
      v-for="(item, index) in defaultAuthors"
      :key="`item-${index}`"
      :item="item"
      :selected-authors="selectedAuthors"
      @select-author="applyFilter"
    />
    <portal to="author-portal" v-if="!filterVisible">
      <indicator-item
        v-for="(author, index) in selectedAuthors"
        :key="`author-${index}`"
        type="author"
        :item="author"
        @select-author="applyFilter"
      />
    </portal>
  </div>
</template>

<script>
import AuthorFilterItem from '@/components/author-filter-item'
import IndicatorItem from '@/components/indicator-item'

export default {
  components: {
    AuthorFilterItem,
    IndicatorItem
  },
  props: {
    defaultAuthors: {
      type: Array,
      required: true
    },
    selectedAuthors: {
      type: Array,
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
        title: 'Autoren'
      }
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
  max-width: var(--max-filter-width);
  margin-bottom: calc(var(--blank-line) * 3.5);
}

.title {
  margin-bottom: var(--spacing-h-medium);
}
</style>
