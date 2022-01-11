<template>
  <div :class="$style.component">
    <div v-html="labels.title" :class="$style.title" />
    <tag-filter-item
      v-for="(item, index) in defaultTags"
      :key="`item-${index}`"
      :item="item"
      :selected-tags="selectedTags"
      @select-tag="applyFilter"
    />
    <portal to="tag-portal" v-if="!filterVisible">
      <indicator-item
        v-for="(tag, index) in selectedTags"
        :key="`tag-${index}`"
        type="tag"
        :item="tag"
        @select-tag="applyFilter"
      />
    </portal>
  </div>
</template>

<script>
import TagFilterItem from '@/components/tag-filter-item'
import IndicatorItem from '@/components/indicator-item'

export default {
  components: {
    TagFilterItem,
    IndicatorItem
  },
  props: {
    defaultTags: {
      type: Array,
      required: true
    },
    selectedTags: {
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
        title: 'Tags'
      }
    }
  },
  // computed: {},
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
  max-width: var(--max-filter-width);
}

.title {
  margin-bottom: var(--spacing-h-medium);
}
</style>
