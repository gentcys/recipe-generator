import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ "modal", "alert" ]

  connect() {
    console.log('hello world');
  }

  showModal() {
    this.modalTarget.classList.add("modal-open");
    this.modalTarget.hidden = false;
  }

  hideModal() {
    this.modalTarget.classList.remove("modal-open");
    this.modalTarget.hidden = true;
  }

  successHandler(event) {
    const [_data, _status, xhr] = event.detail;

    this.modalTarget.innerHTML = xhr.response;
    this.showModal();
  }

  errorHandler(event) {
    const [_data, _status, xhr] = event.detail;

    this.alertMessageTarget.textContent = this.extractErrorMessage(_data);

    this.showAlert();
  }

  createSuccess(event) {
    event.stopPropagation();
    const [_data, _status, xhr] = event.detail;

    console.log(this.sessionController);
    console.log(xhr);
    this.element.parentElement.innerHTML = xhr.response;
  }

  createFail(event) {
    event.stopPropagation();
    const [_data, _status, xhr] = event.detail;

    this.alertTarget.textContent = xhr.response;

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

  get sessionController() {
    return this.application.getControllerForElementAndIdentifier(this.element, "session");
  }
}
