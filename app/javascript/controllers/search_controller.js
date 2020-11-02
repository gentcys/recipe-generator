import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "name", "suggest", "recipes" ]

  search() {
    console.log("search");
  }

  suggest() {
    if (this.nameTarget.value == '') {
      this.hide();
      return;
    }

    const newHref = this.suggestTarget.getAttribute("href").replace(/(name=).*/, '$1' + this.nameTarget.value);
    this.suggestTarget.setAttribute("href", newHref);
    this.suggestTarget.click();
  }

  successHandler(event) {
    const [_data, _status, xhr] = event.detail;

    this.recipesTarget.innerHTML = xhr.response;
    this.show();
  }

  errorHandler(event) {
  }

  show() {
    this.nameTarget.setAttribute('aria-expanded', "true");
    this.recipesTarget.hidden = false;
  }

  hide(event) {
    this.nameTarget.setAttribute('aria-expanded', "false");
    this.recipesTarget.hidden = true;
  }
}
