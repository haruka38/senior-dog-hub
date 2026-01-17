import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  connect() {
    this.timeout = null
  }

  call(event) {
    clearTimeout(this.timeout)

    const body = event.target.value
    if (body.length < 10) return  // ← 短すぎる時は検索しない

    this.timeout = setTimeout(() => {
      fetch(this.urlValue, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept": "text/vnd.turbo-stream.html"
        },
        body: JSON.stringify({ body: body })
      })
    }, 300)
  }
}
