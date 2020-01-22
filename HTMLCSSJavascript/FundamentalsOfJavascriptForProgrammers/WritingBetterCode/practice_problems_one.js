// Identify the code that violates the Airbnb JavaScript style guide, and update the code to fix the issues you
// identify. There may be more than one issue in each code snippet.

// 1
var title = "The Three-Body Problem";
// Use single quotes for strings should be
var title = 'The Three-Body Problem';

// 2
var title = 'The Three-Body Problem',
  author = 'Cixin Liu',
  page_count = 400;
// use one var declaration per variable, variable
// also need to be camelCase
var title = 'The Three-Body Problem';
var author = 'Cixin Liu';
var pageCount = 400;

// 3
var completed = lastPageRead == 400;
// always use strict equality operators
var completed = lastPageRead === 400;

// 4
if (finishedBook())
  console.log('You have finished reading this book');
// use braces for multiline blocks
if (finishedBook()) {
  console.log('You have finished reading this book');
}

// 5
function read(pages) {
    console.log('You started reading.');
    for (var i=0; i<pages; i++) {
        var message = 'You read page '+i;
        console.log(message);
    }
}

read(400);
// set soft tabs to 2 spaces declare or assign variables
// at the top of their scope, use explicit coercions and
// avoid the increment or decrement operators
function read(pages) {
  var i;
  var message;

  console.log('You started reading.');
  for (i=0; i<pages; i += 1) {
    message = 'You read page ' + String(i);
    console.log(message);
  }
}

read(400);