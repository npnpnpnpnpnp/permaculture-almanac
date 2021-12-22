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
        placeholder: 'Search ...'
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
  // border-bottom: 1px solid var(--black);
  background-color: var(--green-light-alpha);
  border: none;
  border-radius: 0.8em;

  @media (min-width: $medium) {
    margin-bottom: var(--filter-spacing-bottom);
  }
}

.form {
  display: flex;
}

.input {
  @extend %input-reset;
  // @include focus-default;

  width: 100%;
  padding: calc(var(--gutter) / 4) calc(var(--gutter) / 2);
  color: var(--black);
  overflow: hidden;
  text-overflow: ellipsis;

  &:focus {
    border-color: var(--green-light);
  }

  &::placeholder {
    color: var(--black);
  }
}

.reset {
  display: inline-block;
  opacity: 0.3;
  pointer-events: none;
  font-size: 1.2;
  padding-right: calc(var(--gutter) / 2);

  &::after {
    display: block;
    content: '\2717';
  }

  .hasValue & {
    opacity: 1;
    pointer-events: auto;
  }
}
</style>
