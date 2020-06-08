let shape = {
  getType: function() {
    return this.type;
  }
}
function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}
Person.prototype.greeting = function() {
  return 'Hello, ' + this.firstName + ' ' + this.lastName;
}
function Triangle(a, b, c) {
  this.a = a;
  this.b = b;
  this.c = c;
  this.type = 'Triangle';
}

Triangle.prototype = Object.create(shape);
Triangle.prototype.constructor = Triangle;
Triangle.prototype.getPerimeter = function() {
  return this.a + this.b + this.c;
}

function User(firstName, lastName) {
  if (this === undefined) {
    let name = `${firstName} ${lastName}`;
    return { name: name };
  } else {
    this.name = `${firstName} ${lastName}`;
  }
}
function createObject(proto) {
  return Object.setPrototypeOf({}, proto);
}
function neww(constructor, args) {
  let object = Object.create(constructor.prototype)
  let result = constructor.apply(object, args);
  return typeof result === 'object' ? result : object;
}

export { Person, Triangle, User, createObject, neww, shape };