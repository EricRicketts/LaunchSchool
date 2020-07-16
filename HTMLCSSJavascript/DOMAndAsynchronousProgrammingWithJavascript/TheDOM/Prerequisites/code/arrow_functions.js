let myObject = {
  myArrowFunction: null,
  myMethod: function() {
    this.myArrowFunction = () => this;
  }
}
let myObjectNoArrow = {
  a: [1, 2, 3, 4, 5, 6],
  sum: function() {
    let self = this;
    function add() {
      return self.a.reduce(function(sum, n) {
        sum += n;
        return sum;
      }, 0);
    }
    return add();
  }
}

let myObjectArrow = {
  a: [1, 2, 3, 4, 5, 6],
  sum: function() {
    function add() {
      return this.a.reduce((sum, n) => sum += n);
    }
    return add();
  }
}

export { myObject, myObjectArrow, myObjectNoArrow };