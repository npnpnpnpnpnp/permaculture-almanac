<template>
  <ul :class="$style.component">
    <li
      v-for="language in availableLanguages"
      :key="language.name"
      :class="$style.item"
    >
      <language-button :language="language" />
    </li>
  </ul>
</template>

<script>
import { mapState } from 'vuex'
import LanguageButton from '@/components/language-button.vue'

export default {
  components: { LanguageButton },
  computed: {
    ...mapState(['availableLanguages'])
  }
}
</script>

<style lang="scss" module>
//.component {}
</style>
