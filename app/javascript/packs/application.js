// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application.scss"; 

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import Raty from "../raty.js"
window.raty = function(elem,opt) {
    let raty =  new Raty(elem,opt)
    raty.init();
    return raty;
}

window.toggleBody = function(event, id) {
    const body = document.getElementById(`body-${id}`);
    const btn = event.target;
  
    if (body.classList.contains("body-collapse")) {
      body.classList.remove("body-collapse");
      btn.textContent = "閉じる";
    } else {
      body.classList.add("body-collapse");
      btn.textContent = "続きを読む";
    }
  }

  require.context('../images', true)