function includesFalse(list) {
  var i;
  var element;

  for (i = 0; i < list.length; i += 1) {
    element = list[i];
    if (element == false) { return true; }
  }

  return false;
}

function includesFalseFix(list) {
  let i;
  let element;

  for (i = 0; i < list.length; i +=1 ) {
    element = list[i];
    if (element === false) { return true; }
  }

  return false;
}

export { includesFalse, includesFalseFix };

/*
the problem with the original code is that a non-strict equality is being used in line 7 of the
original code, so when compared with 0 or an empty string the conditional will be true and not
false which is the desired result.
 */