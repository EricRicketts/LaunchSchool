function createObject(classDef, ...args) {
  return new classDef(...args);
}

class Rectangle {
  constructor(length, width) {
    this.length = length;
    this.width = width;
  }
  getArea() {
    return this.length * this.width;
  }

  toString() {
    return `[Rectangle ${this.length * this.width}]`;
  }
}

export { Rectangle, createObject };