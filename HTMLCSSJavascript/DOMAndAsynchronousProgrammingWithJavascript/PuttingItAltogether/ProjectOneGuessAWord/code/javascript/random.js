let words = [
  'stipend', 'foolish', 'signal', 'constant', 'bedazzle',
  'unction', 'abort', 'abrogate', 'upload', 'bequeath'
];

function random() {
  let chosenIndex = Math.floor(Math.random() * words.length);
  return words.splice(chosenIndex, 1)[0];
}

export { words, random };

