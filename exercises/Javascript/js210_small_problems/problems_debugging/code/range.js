/*
function range(start, end) {
  var range = [];
  var element;
  for (element = start; element <= end; element++) {
    range.push(element);
  }

  return range;
}

function range(end) {
  return range(0, end);
}
*/

function rangeFix(end, start = 0) {
  let range = [];
  let element;
  for (element = start; element <= end; element += 1) {
    range.push(element);
  }

  return range;
}

export { rangeFix };

/*
Launch School explained the RangeError very well.  So Javascript does not support
'function overloading', that is functions with the same name but different parameter
lists.  So in this case there are two declarations for range and only the second
declaration will be used.

So when range is called via range(10, 20), the second definition is used and sets
end = 10.  Then is enters the body of the function and calls range(0, end) which is
range(0, 10), but this version of range only has one parameter so it ends up calling
range(0), then it tries to execute the function and goes back to line 12 and calls
range(0), it enters the body again and ends up calling range(0, 0) which is the same
as called range(0).  Essentially the body of this version of range ends up calling
itself over and over because the first declaration of range is ignored by Javascript.
 */