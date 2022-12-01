import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs

  static get targets() {
    return [ "startTime", "endTime" ]
  }

  connect() {
    // flatpickr(this.startTimeTarget, {})
    flatpickr(this.endTimeTarget, {})
  }
}
