import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ "modal", "dropdown", "username", "password", "alert", "alertMessage" ]

  showModal() {
    this.modalTarget.classList.add("modal-open");
    this.modalTarget.hidden = false;
  }

  hideModal() {
    this.modalTarget.classList.remove("modal-open");
    this.modalTarget.hidden = true;
  }

  toggleDropdown() {
    if (this.dropdownTarget.hidden) {
      this.dropdownTarget.hidden = false;
    } else {
      this.dropdownTarget.hidden = true;
    }
  }

  successHandler(event) {
    const [_data, _status, xhr] = event.detail;

    this.hideModal();
    this.element.innerHTML = xhr.response;
  }

  errorHandler(event) {
    const [_data, _status, xhr] = event.detail;

    this.alertMessageTarget.textContent = this.extractErrorMessage(_data);

    this.showAlert();
  }

  extractErrorMessage(data) {
    var defaultMessage = "Something seriously bad happened.";
    if (data.length == 0) {
      return defaultMessage;
    }

    if (data[0].length < 2) {
      return defaultMessage;
    }

    return data[0][1];
  }

  showAlert() {
    this.alertTarget.hidden = false;
  }

  hideAlert() {
    this.alertTarget.hidden = true;
  }
}
