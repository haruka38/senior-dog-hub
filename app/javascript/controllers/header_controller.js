import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
  static targets = ["bars", "xmark", "menu"]

  toggleMenu(){
    this.barsTarget.classList.toggle("hidden");
    this.xmarkTarget.classList.toggle("hidden");
    this.menuTarget.classList.toggle("translate-x-full");
  }
}