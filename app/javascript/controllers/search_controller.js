import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "name", "recipes" ]

  suggest(event) {
    if (this.nameTarget.value == '') {
      this.hide();
      return;
    }

    fetch(`${this.data.get("url")}/?name=${this.nameTarget.value}`, {
      headers: { accept: 'application/json' }
    }).then((response) => response.json())
      .then(data => {
        var recipesHTML = "";
        Object.values(data).forEach(recipe => {
          recipesHTML += this.recipeTemplate(recipe);
        });
      this.recipesTarget.innerHTML = recipesHTML;
      });

    this.show();
  }

  show() {
    this.nameTarget.setAttribute('aria-expanded', "true");
    this.recipesTarget.hidden = false;
  }

  hide(event) {
    this.nameTarget.setAttribute('aria-expanded', "false");
    this.recipesTarget.hidden = true;
  }

  recipeTemplate(recipe) {
    return `<a href="#" class="block px-4 py-2 text-sm leading-5 text-gray-700 hover:bg-gray-100 hover:text-gray-900 focus:outline-none focus:bg-gray-100 focus:text-gray-900" role="menuitem">${recipe.name}</a>`;
  }
}
