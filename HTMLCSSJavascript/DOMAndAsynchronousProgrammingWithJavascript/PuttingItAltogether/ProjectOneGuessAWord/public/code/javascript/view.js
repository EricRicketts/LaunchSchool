function removeSpans(parent) {
  Array.from(parent.childNodes).forEach(node => {
    if (node.nodeName !== 'H2') {
      parent.removeChild(node);
    }
  })
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

export { View };