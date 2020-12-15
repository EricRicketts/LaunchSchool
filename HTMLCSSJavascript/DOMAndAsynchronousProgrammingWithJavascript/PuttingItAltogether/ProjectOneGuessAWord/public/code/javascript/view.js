function removeSpans(parent) {
  Array.from(parent.childNodes).forEach(node => {
    if (node.nodeName !== 'H2') {
      parent.removeChild(node);
    }
  });
}
function resetApples (document) {
  let apples = document.getElementById('apples');
  apples.setAttribute('class', 'guess_1');
}
function resetGuesses(document) {
  let guesses = document.getElementById('guesses');
  removeSpans(guesses);
}
function resetMessage(document) {
  let message = document.getElementById('message');
  while (message.firstChild) { message.removeChild(message.lastChild); }
}
function resetReplay(document) {
  let replay = document.getElementById('replay');
  replay.removeAttribute('class');
}
function resetSpaces(document, numberOfSpaces) {
  let spaces = document.getElementById('spaces');
  removeSpans(spaces)
  for (let index = 0; index < numberOfSpaces; index += 1) {
    let span = document.createElement('span');
    spaces.appendChild(span);
  }
}

function View(document) {
  this.document = document;
}
View.prototype = {
  constructor: View,
  init: function(numberOfSpaces) {
    resetApples(this.document);
    resetMessage(this.document);
    resetReplay(this.document);
    resetSpaces(this.document, numberOfSpaces);
    resetGuesses(this.document);
    this.document.body.removeAttribute('class');
  },
  outOfWords: function() {
    const outOfWordsMessage = 'The Game is out of words.';
    let message = this.document.getElementById('message');
    let replay = this.document.getElementById('replay');

    this.document.body.setAttribute('class', 'lose');
    let text = this.document.createTextNode(outOfWordsMessage);
    message.appendChild(text);
    replay.removeAttribute('class');
  },
  processLoss: function() {
    const winMessage = 'Sorry, you lost.';
    let message = this.document.getElementById('message');
    let replay = this.document.getElementById('replay');

    this.document.body.setAttribute('class', 'lose');
    let text = this.document.createTextNode(winMessage);
    message.appendChild(text);
    replay.setAttribute('class', 'visible')
  },
  processWin: function() {
    const winMessage = 'You win!!';
    let message = this.document.getElementById('message');
    let replay = this.document.getElementById('replay');

    this.document.body.setAttribute('class', 'win');
    let text = this.document.createTextNode(winMessage);
    message.appendChild(text);
    replay.setAttribute('class', 'visible')
  },
  updateGuesses: function(letter) {
    let guesses = this.document.getElementById('guesses');
    let span = this.document.createElement('span');
    let text = this.document.createTextNode(letter);
    span.appendChild(text);
    guesses.appendChild(span);
  },
  updateRemainingGuesses: function(incorrectGuessCount) {
    this.document.getElementById('apples').setAttribute('class', `guess_${incorrectGuessCount}`);
  },
  updateSpaces: function(gameLetterArray) {
    let allSpans = Array.from(this.document.getElementById('spaces').getElementsByTagName('span'));
    allSpans.forEach((span, index) => {
      if (span.textContent === '' && gameLetterArray[index] !== undefined) {
        let text = this.document.createTextNode(gameLetterArray[index]);
        span.appendChild(text);
      }
    });
  }
}

export { View };