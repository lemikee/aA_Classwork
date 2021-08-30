const MovingObject = require("./moving_object");
const Util = require("./util");

const DEFAULT = {
  COLOR: "#adacaa",
  RADIUS: 30
}

function Asteroid(options) {
  options.color = DEFAULT.COLOR;
  options.radius = DEFAULT.RADIUS;

  MovingObject.call(this, options);
}
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;