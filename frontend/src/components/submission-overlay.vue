<template>
  <div v-if="submissionVisible" :class="$style.component">
    <button type="button" :class="$style.close" @click="close" />

    <h2 :class="$style.formTitle">Submission of resource entry</h2>
    <!-- <h2 :class="$style.formTitle">{{ $t('particulars') }}</h2> -->
    <!-- <form
      method="post"
      action="mailto:default@elitemail.org?subject=Permaculture Almanac: New Submission of resource"
    >
      <input type="submit" value="Send Email" />
    </form> -->

    <a
      href="mailto:default@elitemail.org?subject=Permaculture Almanac: New Submission of resource"
      >send</a
    >

    <div v-if="isSubmitted">
      thank you for your submission! we will review it accordingly.
    </div>
  </div>
</template>

<script>
import ApiService from '@/services/api'

export default {
  props: {
    submissionVisible: {
      type: Boolean,
      required: true
    }
  },
  data() {
    return {
      labels: {
        close: 'Close',
        submit: 'Submit',
        reset: 'Reset'
      },
      isSubmitted: false,
      response: null
    }
  },
  computed: {
    validationMessage() {
      return {
        // required: this.$t('errorMessage')
        required: 'error!'
      }
    }
  },
  methods: {
    reset() {
      // clear inputs here
      // this.filter.map(item => delete this.filter(item))
    },
    close() {
      this.$emit('submission-visibility', false)
      // this.reset()
    },
    // submit() {
    //   // submit to server
    //   this.isSubmitted = true
    //   this.$emit('submission-visibility', false)
    //   this.reset()
    // },
    async submit(data) {
      try {
        this.response = await ApiService.post('resource/submit', data)
        // console.log(this.response)
        if (this.response.message === 'success') {
          // Form submitted successfully
          // this.$formulate.reset('donationForm')
          // TODO: show success message
        } else {
          // An error occured
          // TODO: show error message
        }
      } catch (error) {
        this.$formulate.handle(
          {
            formErrors: [`${error}! Please try again`]
          },
          'submissionForm'
        )
      }
    }
  },
  deactivated() {
    // reset submission form to be able to submit again, maybe use a timeout for that
    this.isSubmitted = false
  }
}
</script>

<style lang="scss" module>
.component {
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: var(--white);
  display: flex;
  flex-direction: column;
}

.close {
  align-self: flex-start;
  padding: var(--gutter);

  &::after {
    content: '\27f5';
  }
}

.formTitle {
  @extend %fw-bold;

  margin: calc(var(--blank-line) * 5) 0;
  text-align: center;
  text-transform: uppercase;
  letter-spacing: var(--letter-spacing-large);
  color: var(--green-light);
}

.form {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: var(--gutter);
  align-self: center;
  width: 70vw;
  max-width: 50em;
  grid-columns: 1 /3;
}

.title,
.subtitle,
.url,
.author,
.description,
.buttons {
  grid-column: 1 / 3;
}

:global(.formulate-input) {
  @extend %input-reset;

  position: relative;
  width: 100%;

  // not buttons

  &:not(:last-of-type) {
    margin-bottom: calc(var(--blank-line) * 1.5);
    padding-bottom: var(--spacing-h-small);
  }

  // & [data-type='button'] {
  //   @extend %button-default;
  // }

  input {
    width: 100%;
  }
}

:global(.formulate-input-element):not(:global(.formulate-input-element--submit)):not(:global(.formulate-input-element--button)):not(:global(.formulate-input-element--textarea)) {
  display: inline-block;
  border-bottom: 1px solid var(--green-light);
  width: 100%;

  ::placeholder {
    color: var(--grey-dark);
  }
}

.buttons {
  // margin-left: 50%;
  // transform: translateX(-50%);
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: var(--gutter);
  width: 100%;
  bottom: 0;
  left: 0;
}

.submit {
  grid-column: 2 / 3;
  margin-bottom: 0;
}

.reset {
  @extend %button-default;

  grid-column: 1 / 2;
}

// :global(.formulate-input-element--submit) {
//   grid-column: 1 /2;
// }

// :global(.formulate-input-element--button) {
//   grid-column: 2 /3;
// }

:global(.formulate-input-element--textarea) {
  textarea {
    border: 1px solid var(--green-light);
  }

  ::placeholder {
    color: var(--grey-dark);
  }
}

input[type='text'],
input[type='tel'],
input[type='email'],
textarea {
  width: 100%;
  padding: calc(var(--gutter) / 4) calc(var(--gutter) / 2);

  // padding: 0;
  // color: var(--blue);
  // border: none;

  // @media (min-width: $large) {
  //   padding-left: var(--gutter);
  // }

  &:focus {
    background-color: var(--green-light-alpha);
    outline: none;
  }
}

:global(.formulate-input-errors) {
  // @extend %fs-form-small;

  position: absolute;
  bottom: calc(var(--blank-line) * -1);
  left: 0;
  margin-left: calc(var(--gutter) / 2);
  color: var(--red);
}

:global(.formulate-input-element--submit),
:global(.formulate-input-element--button) {
  display: inline-block;

  button[type='submit'],
  button[type='button'] {
    @extend %button-default;
  }
}
</style>
