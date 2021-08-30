console.log("Webpack is working!")

const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");

window.addEventListener('DOMContentLoaded', () => {
  const cir = document.getElementById("canvas");
  const ctx = cir.getContext("2d");
  window.ctx = ctx;

  const mo = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"
  });

  const ast = new Asteroid({ pos: [30, 30] });
  window.ast = ast;

  const game = new Game();
  window.game = game;

  // mo.draw(ctx);

});

window.MovingObject = MovingObject;
window.Game = Game;