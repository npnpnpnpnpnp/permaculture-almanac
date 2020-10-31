// Return default meta info for views

import { decodeHtml } from '@/mixins/decode-html'

export const metaInfo = {
  mixins: [decodeHtml],
  metaInfo() {
    return {
      title: this.page.fields ? this.decodeHtml(this.page.fields.title) : ''
    }
  }
}
