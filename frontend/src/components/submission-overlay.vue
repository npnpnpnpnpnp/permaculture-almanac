<template>
  <div v-if="submissionVisible" :class="$style.component">
    <button type="button" :class="$style.close" @click="close" />

    <h2 :class="$style.formTitle">Submission of resource entry</h2>
    <!-- <h2 :class="$style.formTitle">{{ $t('particulars') }}</h2> -->

    <FormulateForm
      :class="$style.form"
      :errors="validationMessage"
      name="submissionForm"
      @submit="submit"
    >
      <!-- @validation="handleValidation" -->

      <FormulateInput
        type="text"
        name="title"
        placeholder="title"
        validation="required"
        :class="$style.title"
      />
      <!-- :placeholder="$t('title')" -->
      <!-- :validation-messages="{
          required: $t('titleRequired')
        }" -->
      <FormulateInput
        type="text"
        name="subtitle"
        placeholder="subtitle"
        validation="optional"
        :class="$style.subtitle"
      />
      <!-- :placeholder="$t('subtitle')" -->
      <FormulateInput
        type="text"
        name="url"
        placeholder="url"
        validation="required"
        :class="$style.url"
      />
      <!-- :placeholder="$t('url')" -->
      <!-- :validation-messages="{
          required: $t('urlRequired')
        }" -->
      <!-- :validation-messages="validationMessage" -->
      <FormulateInput
        type="text"
        name="author"
        placeholder="author"
        validation="required"
        :class="$style.author"
      />
      <!-- @change="showInput" -->
      <!-- :placeholder="$t('author')" -->
      <!-- :validation-messages="{
          required: $t('authorRequired')
        }" -->
      <!-- :validation-messages="validationMessage" -->
      <FormulateInput
        type="text"
        name="publisher"
        placeholder="publisher"
        validation="optional"
        :class="$style.publisher"
      />
      <!-- :placeholder="$t('publisher')" -->
      <FormulateInput
        type="text"
        name="isbn"
        placeholder="isbn"
        validation="optional"
        :class="$style.isbn"
      />
      <!-- :placeholder="$t('isbn')" -->
      <!-- :validation-messages="validationMessage" -->
      <FormulateInput
        type="textarea"
        name="description"
        placeholder="description"
        validation="optional"
        :class="$style.description"
      />
      <!-- :placeholder="$t('description')" -->

      <!-- error-behavior="submit" -->
      <!-- necessary fields: dropdown type, tags, separated by commas. check other types for additional fields. first type selection, then specific fields are displayed -->
      <FormulateInput type="submit" :class="$style.button" id="submit">
        <!-- <span v-if="!this.isSubmitted" :class="$style.label">{{
          $t('buttonSend')
        }}</span> -->
        <span v-if="!this.isSubmitted" :class="$style.label">
          send
        </span>
        <!-- <span v-else :class="$style.label">{{ $t('buttonSubmitted') }}</span> -->
        <span v-else :class="$style.label">submitted</span>
      </FormulateInput>
      <FormulateErrors />
      <div v-if="isSubmitted" :class="$style.success">
        <!-- {{ $t('successMessage') }} -->
        success
      </div>
    </FormulateForm>

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
.button {
  grid-column: 1 / 3;
}

:global(.formulate-input) {
  @extend %input-reset;

  position: relative;
  width: 100%;

  &:not(:last-of-type) {
    margin-bottom: calc(var(--blank-line) * 1.5);
    padding-bottom: var(--spacing-h-small);
  }

  input {
    width: 100%;
  }
}

:global(.formulate-input-element):not(:global(.formulate-input-element--submit)):not(:global(.formulate-input-element--textarea)) {
  display: inline-block;
  border-bottom: 1px solid var(--green-light);
  width: 100%;

  ::placeholder {
    color: var(--grey-dark);
  }
}

:global(.formulate-input-element--submit) {
  margin-left: 50%;
  transform: translateX(-50%);
}

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

:global(.formulate-input-element--submit) {
  display: inline-block;

  button[type='submit'] {
    @extend %button-default;
  }
}
</style>
