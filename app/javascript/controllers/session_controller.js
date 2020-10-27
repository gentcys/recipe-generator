import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ "username", "password", "alert", "alertMessage" ]

  successHandler(event) {
    var detail = event.detail;
    var data = detail[0], status = detail[1], xhr = detail[2];
    console.log(detial);
    console.log(data);

    this.hideAlert();
  }

  errorHandler(event) {
    var detail = event.detail;
    var data = detail[0], status = detail[1], xhr = detail[2];
    console.log(data[0][1]);
    console.log(xhr);

    this.alertMessageTarget.textContent = this.extractErrorMessage(data);
    console.log(this.alertMessageTarget.textContent);

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
