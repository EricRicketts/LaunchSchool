function reverse(arg) {
  var reversedArg = [];
  var lastIndex = arg.length - 1;
  
  for (var i = lastIndex; i >= 0; i -= 1) {
    reversedArg.push(arg[i]);
  }

  return Array.isArray(arg) ? reversedArg : reversedArg.join('');
}

export { reverse };