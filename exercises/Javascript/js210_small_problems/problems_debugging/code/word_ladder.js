function wordLadder() {
  var ladder = ''
    ['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(function(word) {
    if (ladder !== '') { ladder += '-'; }
    ladder += word;
  });

  return ladder;
}

function wordLadderFixed() {
  var ladder = ''; // this was the fix adding the semicolon
    ['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(function(word) {
    if (ladder !== '') { ladder += '-'; }
    ladder += word;
  });

  return ladder;
}

export { wordLadder, wordLadderFixed };
/*
this was a rather tricky problem I had no idea where to look for the bug, so I had to examine the
Launch School solution.  Naturally, I learned something.  If we note in line 2 of the wordLadder
function there is not a semicolon after the statement.  So when the forEach is evaluated it looks
like the following to Javascript:

var ladder = ''['head', 'heal', ...]; without the terminating semicolon Javascript joins the two
statements so now what we have is an accessor on an empty string.  Since an empty string does not
have a 'head' property it returns undefined and undefined does not have a forEach method so a TypeError
is thrown => cannot read property 'forEach' of undefined.

Note the error was thrown only when the array was in literal form, when I declared a variable arr
and set it equal to the value above an error was not thrown.
 */