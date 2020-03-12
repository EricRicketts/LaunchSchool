function valence(element) {
  switch (element) {
    case 'H': return 1;
    case 'C': return 4;
    case 'N': return 5;
    case 'O': return 6;
    // omitting the rest
  }
}

function valenceOfMolecule() {
  var sum = 0;

  arguments.forEach(function (atom) {
    var match   = /([a-zA-Z]+)([0-9]*)/.exec(atom);
    var element = match[1];
    var number  = parseInt(match[2]) || 1;

    sum += number * valence(element);
  });

  return sum;
}

function valenceOfMoleculeFix() {
  var sum = 0;
  let args = Array.prototype.slice.call(arguments);

  args.forEach(function (atom) {
    var match   = /([a-zA-Z]+)([0-9]*)/.exec(atom);
    var element = match[1];
    var number  = parseInt(match[2]) || 1;

    sum += number * valence(element);
  });

  return sum;
}

export { valenceOfMolecule, valenceOfMoleculeFix };

/*
quick fix here once I ran the the code itself.  The TypeError occurring in the original function
is due to forEach being called on the arguments object which though has array like characteristics
is not an array.

To fix the issue, simply convert the arguments object into an Array and then call forEach on the
resulting array.
 */