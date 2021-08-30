const MovingObject = require("./moving_object");
const Util = require("./util");
const Asteroid = require("./asteroid");

function Game(){
  this.asteroids = [];

  this.addAsteroids();
}

Game.DIM_X = 500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 5;

Game.prototype.addAsteroids = function addAsteroids() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    let position = this.randomPosition();
    const asteroid = new Asteroid ({ pos: position });
    this.asteroids.push(asteroid);
  }
}

Game.prototype.randomPosition = function randomPosition() {

  return [
    Math.floor(Game.DIM_X * Math.random()),
    Math.floor(Game.DIM_Y * Math.random())
  ];
}
Game.prototype.draw = function draw(ctx) {
  ctx.clearRect(0, 0, DIM_X, DIM_Y);
  this.asteroids.forEach((asteroid) => {
    asteroid.draw(ctx);
  });
}

module.exports = Game;