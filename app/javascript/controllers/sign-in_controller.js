import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "modal" ]

  showModal() {
    this.modalTarget.classList.add("modal-open");
    this.modalTarget.hidden = false;
  }

  hideModal() {
    this.modalTarget.classList.remove("modal-open");
    this.modalTarget.hidden = true;
  }
}
