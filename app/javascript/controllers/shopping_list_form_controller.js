import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-list-form"
export default class extends Controller {
  static targets = ["newForm", "existingItems", "button"]

  connect() {
    console.log("Hello from the Shopping List Form Controller!")
  }

  revealForm() {
    this.existingItemsTarget.classList.add("d-none")
    this.buttonTarget.classList.add("d-none")
    this.newFormTarget.classList.remove("d-none")
  }
}
