import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "search", "sidebar", "image"]

  connect() {
  }
  change() {
    this.sidebarTarget.classList.toggle("open");

    if(this.sidebarTarget.classList.contains("open")){
      this.menuTarget.classList.replace("bx-menu", "bx-menu-alt-right");
      setTimeout(()=>{ this.imageTarget.classList.toggle("d-none") }, 500);
    }else {
      this.menuTarget.classList.replace("bx-menu-alt-right","bx-menu");
      this.imageTarget.classList.toggle("d-none");
    }
  }
}
