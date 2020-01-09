function one() {
  function log(result) {
    return result;
  }
  
  function anotherOne() {
    var result = '';
    var i;
    for (i = 0; i < arguments.length; i += 1) {
      result += String.fromCharCode(arguments[i]);
    }

    return log(result)
  }
  
  function anotherAnotherOne() {
    var space = String.fromCharCode(32);
    var result = String.fromCharCode(87, 101, 108, 99, 111, 109, 101);
    return result + space + anotherOne(116, 111) + space;
  }

  return { first: anotherAnotherOne() + anotherOne(116, 104, 101), second: anotherOne };
}

export { one };