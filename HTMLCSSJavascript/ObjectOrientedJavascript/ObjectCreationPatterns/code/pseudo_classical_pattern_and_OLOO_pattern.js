function Point(x, y) {
  this.x = x || 0;
  this.y = y || 0;
}
Point.prototype.distanceToOrigin = function() {
  return Math.sqrt(Math.pow(this.x, 2) + Math.pow(this.y, 2));
}
Point.prototype.onXAxis = function() {
  return this.y === 0;
}
Point.prototype.onYAxis = function() {
  return this.x === 0;
}

let PointOLOO = {
  x: 0,
  y: 0,
  init: function(x, y) {
    this.x = x;
    this.y = y;
    return this;
  },
  distanceToOrigin: function() {
    return Math.sqrt(Math.pow(this.x, 2) + Math.pow(this.y, 2));
  },
  onXAxis: function() {
    return this.y === 0;
  },
  onYAxis: function() {
    return this.x === 0;
  }
}
export { Point, PointOLOO };