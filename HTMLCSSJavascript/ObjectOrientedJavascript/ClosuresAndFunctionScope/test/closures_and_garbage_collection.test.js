// Problems
/*
1.  In the following code, when can JavaScript garbage collect the values assigned to the variables a, b, and c?
*/
var a = 34;

function add(b) {
  a += b;
}

function run() {
  var c = add(4);
}

run();

/*
var a = 34;

function add(b) {
  a += b;
  // We can GC the value `34` initially assinged to `a` after we replace
  // the value assigned to it with the `38` (result of `34` + `4`)
}
// The value assigned to `b` is a copy of the value `4` passed as an argument.
// Since it's a copy, we can GC it as soon as the function finishes running.

function run() {
  var c = add(4);
} // The value of c is eligible for GC when this function returns.

run();
// The value of `38` assigned to `a` is eligible for GC when the program finishes running
*/

/*
2.  In the following code, when can JavaScript garbage collect the value "Steve"?
*/
function makeHello(name) {
  return function() {
    console.log("Hello, " + name + "!");
  };
}

var helloSteve = makeHello("Steve");

/*
"Steve" is eligible for GC when the program finishes; specifically, after JavaScript garbage collects
the function referenced by helloSteve.
*/