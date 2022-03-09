<template>
  <main :class="$style.view" v-if="page.fields">
    <resource-filter
      :default-categories="defaultCategories"
      :default-tags="page.tags"
      :default-authors="page.authors"
      :filter-visible="filterVisible"
      @update-filter="handleFilter"
      @filter-visibility="handleFilterVisibility"
    />
    <div :class="$style.content">
      <div :class="$style.controls" :style="controlsStyle" ref="controls">
        <button
          v-if="showOpen"
          type="button"
          v-html="labels.openFilter"
          :class="$style.open"
          @click="openFilter"
        />
        <search-input @change-value="handleSearchQuery" :value="query" />
      </div>
      <filter-indicator
        :filter="filter"
        :filter-visible="filterVisible"
        :controls-height="controlsHeight"
        @indicator-height="handleIndicatorHeight"
      />
      <repeater-matrix
        :items="page.children"
        :query="query"
        :selected-categories="filter.selectedCategories"
        :selected-tags="filter.selectedTags"
        :selected-authors="filter.selectedAuthors"
        :controls-height="controlsHeight"
        :indicator-height="indicatorHeight"
      />
      <div :class="$style.submitWrapper">
        <a
          href="mailto:default@elitemail.org?subject=Permaculture Almanac: New Submission of resource"
          :class="$style.submit"
          >{{ labels.submit }}
        </a>
      </div>
    </div>

    <!-- <button type="button" @click="openSubmission" :class="$style.submit">
      open
    </button> -->

    <!-- <submission-overlay
      :submission-visible="submissionVisible"
      @submission-visibility="handleSubmissionVisibility"
    /> -->
  </main>
</template>

<script>
import PageService from '@/services/page'
import { metaInfo } from '@/mixins/meta-info'
import RepeaterMatrix from '@/components/repeater-matrix'
import ResourceFilter from '@/components/resource-filter.vue'
import SearchInput from '@/components/search-input'
import FilterIndicator from '@/components/filter-indicator'
import { mapState } from 'vuex'
import { debounce } from 'lodash'
import EventBus from '@/event-bus'
// import SubmissionOverlay from '@/components/submission-overlay'

export default {
  components: {
    RepeaterMatrix,
    ResourceFilter,
    SearchInput,
    FilterIndicator
    // SubmissionOverlay
  },
  mixins: [metaInfo],
  data() {
    return {
      page: {},
      loading: true,
      query: '',
      filter: {},
      filterVisible: false,
      submissionVisible: false,
      labels: {
        openFilter: 'Filter',
        submit: 'Submit entry'
      },
      controlsHeight: 0,
      indicatorHeight: 0
    }
  },
  async created() {
    this.page = await PageService.get({ path: this.$route.path })
    this.loading = false
  },
  computed: {
    ...mapState(['isDesktop', 'headerHeight']),
    controlsStyle() {
      return {
        top: this.headerHeight + 'px'
      }
    },
    showOpen() {
      return this.isDesktop ? false : true
    },
    defaultCategories() {
      let categories = []
      this.page.children.map(child => {
        // create object for category to make further usage easier
        let categoryObject = {
          fields: {
            title: child.meta.template
          }
        }
        // use find with explicit condition to indentify only one match
        const categoryExists = categories.find(
          category => category.fields.title === child.meta.template
        )
        if (!categoryExists) categories.push(categoryObject)
      })
      return categories
    }
  },
  methods: {
    handleIndicatorHeight(height) {
      this.indicatorHeight = height
    },
    openSubmission() {
      this.submissionVisible = true
    },
    handleSubmissionVisibility(visibility) {
      this.submissionVisible = visibility
    },
    openFilter() {
      this.filterVisible = true
    },
    handleFilterVisibility(visibility) {
      this.filterVisible = visibility
    },
    // get all filter updates from filter component
    handleFilter(value) {
      // store the updated filter value locally to be able to pass it down to repeater components
      this.filter = value
    },
    // get current search value from search-input
    handleSearchQuery(query) {
      this.query = query
    },
    getControlsHeight() {
      // send current controls height to table head in repeater-matrix for stickiness of controls
      this.controlsHeight = this.$refs.controls.offsetHeight
    },
    onResize: debounce(function() {
      if (!this.$refs.controls) return
      this.getControlsHeight()
    }, 50)
  },
  mounted() {
    window.addEventListener('resize', this.onResize)
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.onResize)
  },
  watch: {
    loading() {
      if (!this.loading) {
        EventBus.$emit('page-loaded')
        this.$nextTick(() => {
          this.getControlsHeight()
        })
      }
    }
  }
}
</script>

<style lang="scss" module>
.view {
  padding: 0 var(--gutter) var(--gutter) var(--gutter);
  min-height: 100%;

  @media (min-width: $medium) {
    display: grid;
    grid-template-columns: 33.333% auto;
    grid-gap: calc(var(--gutter) * 1.5);
  }

  @media (min-width: $large) {
    grid-template-columns: 25% auto;
  }
}

.controls {
  position: sticky;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: var(--gutter);
  padding-bottom: var(--blank-line);
  background-color: var(--white);

  @media (min-width: $xsmall) {
    grid-template-columns: 1fr 2fr;
  }

  @media (min-width: $medium) {
    grid-template-columns: 1fr;
    padding-bottom: calc(var(--blank-line) * 2);
  }

  @media (min-width: $large) {
    // padding-bottom: unset;
    grid-template-columns: repeat(2, 1fr);
  }

  @media (min-width: $xxlarge) {
    grid-template-columns: 1fr 2fr;
  }
}

.open {
  @extend %button-default;

  @media (min-width: $small) {
    max-width: 50%;
  }

  @media (min-width: $medium) {
    max-width: unset;
  }
}

.submitWrapper {
  position: fixed;
  bottom: calc(var(--blank-line) * 1.5);
  pointer-events: none;
  left: 50%;
  transform: translateX(-50%);

  @media (min-width: $medium) {
    bottom: 0;
    left: unset;
    transform: unset;
    display: flex;
    align-items: center;
    height: calc(var(--blank-line) * 4);
    background-color: var(--white);
    background: linear-gradient(to bottom, rgba(255, 255, 255, 0), white 50%);
    width: 100%;
  }
}

.submit {
  @extend %button-default;
  @extend %link-reset;

  pointer-events: auto;
  box-shadow: var(--box-shadow);
  padding: calc(var(--blank-line) / 4) calc(var(--gutter) / 2);
  background-color: var(--white);
}
// .title {}
// .body {}
</style>
