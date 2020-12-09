let words = [
  'stipend', 'foolish', 'signal', 'constant', 'bedazzle',
  'unction', 'abort', 'abrogate', 'upload', 'bequeath',
  'brilliant', 'genius', 'admonish', 'zenith', 'constraint'
].map(word => word.toUpperCase());
function randomWord() {
  let chosenIndex = Math.floor(Math.random() * words.length);
  return words.splice(chosenIndex, 1)[0];
};

export { randomWord };
