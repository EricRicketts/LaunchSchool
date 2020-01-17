function placeABet(guess) {
  (function generateRandomInt() {
    return Math.floor(Math.random() * 25) + 1;
  });

  var winningNumber = generateRandomInt();

  if (guess < 1 || guess > 25) {
    return 'Invalid guess. Valid guesses are between 1 and 25.';
  }

  if (guess === winningNumber) {
    return "Congratulations, you win!";
  } else {
    return "Wrong-o! You lose.";
  }
}

function placeABetFixed(guess) {
  function generateRandomInt() {
    return Math.floor(Math.random() * 25) + 1;
  }

  var winningNumber = generateRandomInt();

  if (guess < 1 || guess > 25) {
    return 'Invalid guess. Valid guesses are between 1 and 25.';
  }

  if (guess === winningNumber) {
    return "Congratulations, you win!";
  } else {
    return "Wrong-o! You lose.";
  }
}

export { placeABet, placeABetFixed };
/*
the problem with the original code is that there is an incorrect
function declaration on lines 2-4, so when there is an attempt to
invoke the function on line 6, a ReferenceError is thrown.

Wrapping a function declaration in parenthesis must be accompanied by
assignment, otherwise leave the parenthesis off unless you want to do
an IIFE, but that must be accompanied by a call at the end of the
expression.

A function declaration must begin with the function keyword and nothing else,
otherwise it is a function expression.  In this case a function expression has
been used but it has not been assigned to any variable in lines 2-4, because of
this error, the function is not retrievable.
 */