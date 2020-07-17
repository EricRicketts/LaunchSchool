function createObject(classDef, ...args) {
  return new classDef(...args);
}

class Rectangle {
  static description = 'A rectangle is a 4 sided figure with 2 pairs of equal sides.';

  constructor(length, width) {
    this.length = length;
    this.width = width;
  }

  static getDescription() {
    return 'Foo';
  }

  getArea() {
    return this.length * this.width;
  }

  toString() {
    return `[${this.constructor.name} ${this.length * this.width}]`;
  }
}

class Square extends Rectangle {
  constructor(side) {
    super(side, side)
  }
}

export { createObject, Rectangle, Square };