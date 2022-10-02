import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "search", "sidebar"]

  connect() {
  }
  change() {
    this.sidebarTarget.classList.toggle("open");

    if(this.sidebarTarget.classList.contains("open")){
      this.menuTarget.classList.replace("bx-menu", "bx-menu-alt-right");
    }else {
      this.menuTarget.classList.replace("bx-menu-alt-right","bx-menu");
    }
  }
}
