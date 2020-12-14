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

let View = {};

View.init = function(document, numberOfSpaces) {
  resetApples(document);
  resetMessage(document);
  resetReplay(document);
  resetSpaces(document, numberOfSpaces);
  resetGuesses(document);
  document.body.removeAttribute('class');
}
View.outOfWords = function(document) {
  const outOfWordsMessage = 'The Game is out of words.';
  let message = document.getElementById('message');
  let replay = document.getElementById('replay');

  document.body.setAttribute('class', 'lose');
  let text = document.createTextNode(outOfWordsMessage);
  message.appendChild(text);
  replay.removeAttribute('class');
}
View.processLoss = function(document) {
  const winMessage = 'Sorry, you lost.';
  let message = document.getElementById('message');
  let replay = document.getElementById('replay');

  document.body.setAttribute('class', 'lose');
  let text = document.createTextNode(winMessage);
  message.appendChild(text);
  replay.setAttribute('class', 'visible')
}
View.processWin = function(document) {
  const winMessage = 'You win!!';
  let message = document.getElementById('message');
  let replay = document.getElementById('replay');

  document.body.setAttribute('class', 'win');
  let text = document.createTextNode(winMessage);
  message.appendChild(text);
  replay.setAttribute('class', 'visible')
}
View.updateGuesses = function(document, letter) {
  let guesses = document.getElementById('guesses');
  let span = document.createElement('span');
  let text = document.createTextNode(letter);
  span.appendChild(text);
  guesses.appendChild(span);
}
View.updateRemainingGuesses = function(document, incorrectGuessCount) {
  document.getElementById('apples').setAttribute('class', `guess_${incorrectGuessCount}`);
}
View.updateSpaces = function(document, gameLetterArray) {
  let allSpans =  Array.from(document.getElementById('spaces').getElementsByTagName('span'));
  allSpans.forEach((span, index) => {
    if (span.textContent === '' && gameLetterArray[index] !== undefined) {
      let text = document.createTextNode(gameLetterArray[index]);
      span.appendChild(text);
    }
  });
}

export { View };