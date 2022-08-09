import { Controller } from "@hotwired/stimulus";
import { marked } from "marked";
import DOMPurify from "dompurify";

// Connects to data-controller="live-preview"
export default class extends Controller {
  static targets = ["edit", "preview"];

  connect() {
    this.update();
  }

  update() {
    this.previewTarget.innerHTML = DOMPurify.sanitize(marked.parse(this.editTarget.value));
  }
}
