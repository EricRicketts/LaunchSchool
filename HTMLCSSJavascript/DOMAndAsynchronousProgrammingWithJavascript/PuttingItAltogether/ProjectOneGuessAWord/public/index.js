import { Game } from "./code/javascript/game.js";
import { View } from "./code/javascript/view.js";
import { Controller } from "./code/javascript/controller.js";

document.addEventListener('DOMContentLoaded', event => {
  let replay = document.getElementById('replay');
  let controller = new Controller(new Game(), new View(document));
  controller.init();

  replay.addEventListener('click', event => {
    controller = new Controller(new Game(), new View(document));
    controller.init();
  });
});
