import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "bars", "xmark"]

  toggleMenu() {
    this.menuTarget.classList.toggle("hidden")
    this.barsTarget.classList.toggle("hidden")
    this.xmarkTarget.classList.toggle("hidden")
  }
}