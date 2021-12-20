<template>
  <div :class="classes.component">
    <!-- <label>Search:</label> -->
    <form :class="$style.form">
      <input
        id="search"
        :placeholder="labels.placeholder"
        autocomplete="off"
        :class="$style.input"
        @input="debounceInput($event.target.value)"
      />
      <!-- :name="name" -->
      <!-- :value="value" -->
      <!-- @input="debounceInput" -->
      <button type="reset" :class="$style.reset" @click="clear" />
    </form>
  </div>
</template>

<script>
import { debounce } from 'lodash'

export default {
  props: {
    value: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      labels: {
        placeholder: 'Ich suche...'
      },
      query: ''
    }
  },
  computed: {
    classes() {
      return {
        component: [
          this.$style.component,
          this.hasValue ? this.$style.hasValue : ''
        ]
      }
    },
    hasValue() {
      return this.query.length > 0
    }
  },
  methods: {
    debounceInput: debounce(function(query) {
      this.query = query
      this.$emit('change-value', this.query)
    }, 100),

    clear() {
      this.query = ''
      this.$emit('change-value', '')
    }
  },
  watch: {
    value() {
      this.query = this.value
    }
  }
}
</script>

<style lang="scss" module>
.component {
  border-bottom: 1px solid var(--black);

  @media (min-width: $medium) {
    margin-bottom: var(--filter-spacing-bottom);

    // min-width: 50vw;
    // max-width: 50%;
  }
}

.form {
  display: flex;
}

.input {
  @extend %input-reset;
  // @include focus-default;
  // @extend %ff-sans;

  width: 100%;
  padding: calc(var(--gutter) / 2) var(--gutter) calc(var(--gutter) / 4) 0;
  color: var(--black);
  overflow: hidden;
  text-overflow: ellipsis;

  // &:focus {
  // }

  &::placeholder {
    color: var(--black);
  }

  @media (min-width: $small) {
    padding: calc(var(--gutter) / 2) var(--gutter) calc(var(--gutter) / 4) 0;
  }
}

.reset {
  // @extend %fs-large;
  // @extend %ff-symbols;

  display: inline-block;
  opacity: 0.3;
  pointer-events: none;
  transition: opacity var(--xshort) ease;

  &::before {
    display: block;
    content: '\2573';
    // margin-top: -0.1em;
  }

  .hasValue & {
    opacity: 1;
    pointer-events: auto;
  }
}
</style>
