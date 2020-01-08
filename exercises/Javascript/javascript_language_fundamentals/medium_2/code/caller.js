function doubler(number, caller) {
  return [(number + number), caller];
}

function makeDoubler(caller) {
  return function(number) {
    return [(number + number), caller];
  }
}

export { doubler, makeDoubler };