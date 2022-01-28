<template>
  <div v-if="submissionVisible" :class="$style.component">
    <button type="button" @click="close">{{ labels.close }}</button>

    <form @submit="submit">
      <div :class="$style.controls">
        <input type="email" name="email" />
        <input name="title" />

        <button type="button" :class="$style.reset" @click="reset">
          <!-- :disabled="isDisabled" -->
          {{ labels.reset }}
        </button>
        <button type="submit" @click="submit" :class="$style.submit">
          {{ labels.submit }}
        </button>
      </div>
    </form>

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
  methods: {
    reset() {
      // this.filter.map(item => delete this.filter(item))
    },
    close() {
      this.$emit('submission-visibility', false)
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
        console.log(this.response)
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
  background-color: red;
}
</style>
