let stack = (function() {
  let array = [];

  return {
    push: function(val) {
      return array.push(val);
    },
    pop: function() {
      return array.pop();
    },
    printStack: function() {
      return array.join('\n');
    },
    clear: function() {
      array = [];
      return array;
    }
  }
})();

export { stack };
