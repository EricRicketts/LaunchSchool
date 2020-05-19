// 1.  Is JavaScript a garbage-collected language, and if so, what does this entail?
/*
  Javascript is a garbage-collected language.  This means that the JS runtime, rather than the developer, handles
  memory deallocation.
*/

// 2. Consider the code below, Are either of the values 1 or "A string" eligible for garbage collection
// on line 13? What about on line 18?
var myNum = 1;

function foo() {
  var myStr = 'A string';
  // what is eligible for GC here?
}

foo();

// what is eligible for GC here?

// more code
/*
  Launch School answer:
  Neither myNum or myStr are available for garbage collection on line 13, however, 'A string' is available for
  garbage collection on line 18.

  In the context of this code snippet the references to the values 1 and 'A string' are in the myNum and myStr
  variables.  Since myNum is a global variable it is everywhere available in the code after the initial assignment,
  so it cannot be garbage-collected.  However, myStr is function scoped, so it would be available for garbage
  collection after the invocation on line 16, so it could be garbage collected on line 18.
*/

// 3. In the code below, is the value referenced by outerFoo eligible for garbage collection on line 42?
var outerFoo;

function bar() {
  var innerFoo = 0;
  outerFoo = innerFoo;
}

bar();

// can outerFoo's 0 be garbage collected here?

// more code
/*
My initial answer:
I would say no, because outerFoo is globally scoped it is everywhere available, so once the variable is given
a value in line 37, Javascript must allow it to be referenced anywhere in the code.  On the other hand, once
the function bar finishes executing on line 40, the innerFoo variable can be garbage collected.

It turns out I gave an answer very similar to Launch School:
No. Although innerFoo's copy of 0 is eligible for garbage collection when bar returns, outerFoo's copy of
the value persists, since it is a global variable.
*/

// 4. Consider the code below, is 0 eligible for garbage collection on line 66?
function makeEvenCounter() {
  var index = 0;
  return function() {
    return index += 2;
  };
}

var evenCounter = makeEvenCounter();

// is 0 eligible for GC here?

// more code
/*
  makeEvenCounter when invoked returns a function and has a closure over the index local variable.  But
  the evenCounter variable is global so it can be referenced anywhere in the code, thus the reference to 0,
  the index variable would not be eligible for garbage collection.

  Launch School answer:
  No, it is not. The closure created on the function returned by makeEvenCounter on line 8 prevents 0
  from being garbage collected.
*/

// 5. Consider the script below will the value "some val" ever be eligible for garbage collection?
var bash = "some val";
/*
  I would say no because just in this code bash is a global variable so it is everywhere available in the
  code base.

  I think the item to remember is that after a script finishes running, many things will be eligible for
  garbage collection.

  Launch School answer:
  Yes. After the script finishes running the value will be eligible for garbage collection.
*/
