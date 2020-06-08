const RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  perimeter: function () {
    return 2 * (this.width + this.height);
  }
}
function Circle(radius) {
  this.radius = radius
}
Circle.prototype.area = function() {
  return Math.PI * Math.pow(this.radius, 2);
}
function Foo() {
  this.arr = [];
  this.a = 2;
  this.bar = function() {
    this.arr.push(this.a);
  }
  this.bar();
}
function Ninja() {
  this.swung = true;
}
function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area();
  this.perimeter = RECTANGLE.perimeter();
}
function RectangleFixed(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.perimeter = RECTANGLE.perimeter.call(this);
}

export { Circle, Foo, Ninja, RECTANGLE, Rectangle, RectangleFixed };
