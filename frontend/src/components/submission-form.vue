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
      <div :class="$style.buttons">
        <FormulateInput type="submit" :class="$style.submit" id="button">
          <!-- <span v-if="!this.isSubmitted" :class="$style.label">{{
          $t('buttonSend')
        }}</span> -->
          <span v-if="!this.isSubmitted" :class="$style.label">
            send
          </span>
          <!-- <span v-else :class="$style.label">{{ $t('buttonSubmitted') }}</span> -->
          <span v-else :class="$style.label">submitted</span>
        </FormulateInput>
        <div :class="$style.button">
          <button type="reset" :class="$style.reset" id="button">
            <span :class="$style.label">
              reset
            </span>
          </button>
        </div>
      </div>
      <FormulateErrors />
      <div v-if="isSubmitted" :class="$style.success">
        <!-- {{ $t('successMessage') }} -->
        success
      </div>
    </FormulateForm>
