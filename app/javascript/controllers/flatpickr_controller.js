import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {enableTime: true,
      // Provide an id for the plugin to work
      plugins: [new rangePlugin({ input: "#end_time"})]})
    flatpickr(this.endTimeTarget, {})
  }
}
