// thousands of lines of messy JavaScript code!

// here you need to loop through and log numbers 0 to 99

// more messy JavaScript code


// 1.  first solution to the problem above
// thousands of lines of messy JavaScript code!

for (var i = 0; i < 100; i += 1) {
  console.log(i);
}

// more messy JavaScript code

/*
this code has a subtle problem can you see it?
My answer, though the loop executes we add yet another variable to the global space and as such we might
be setting a previous assignment of i to an undesired value.

My answer was similar to the Launch School answer:
We don't know whether i is already in the global scope. If i already exists in the global scope,
our definition will alter its value, and that may cause trouble.
*/

// 2. Second solution: Since functions create their own scopes, let's try putting the variable inside
// a function to hide it from the rest of the program:
// thousands of lines of messy JavaScript code!

function loopAndLog() {
  for (var i = 0; i < 100; i += 1) {
    console.log(i);
  }
}

loopAndLog();

// more messy JavaScript code
/*
This function works. It isolates i from other declarations of i in the program, but it has a subtle
problem of its own. Can you identify the problem?

My answer, thought the function contains the variable i within the inner scope of the function, thus avoiding any
collisions with a global variable named i, if there are any function or variable named "loopAndLog" we experience
the same issue we would be potentially over writing a previously declared loopAndLog variable.

Launch School answer:
We don't know whether the program already contains a loopAndLog function in the global scope. If there's a
clash of function names, one will overwrite the other, and there will be trouble.
*/

// We can solve both problems above by an anonymous IIFE:
// thousands of lines of messy JavaScript code!

(function() {
  for (var i = 0; i < 100; i += 1) {
    console.log(i);
  }
})();

// more messy JavaScript code

// thousands of lines of messy JavaScript code!

(function(number) {
  for (var i = 0; i < number; i += 1) {
    console.log(i);
  }
})(100);

// more messy JavaScript code