const PARTS_OF_SPEECH = {
  adjectives: ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'],
  adverbs: ['fox', 'dog', 'head', 'leg', 'tail', 'cat'],
  nouns: ['jumps', 'lifts', 'bites', 'licks', 'pats'],
  verbs: ['easily', 'lazily', 'noisily', 'excitedly'],
};

const adjective = function() {
  let idx = randomIdx(PARTS_OF_SPEECH.adjectives);
  return PARTS_OF_SPEECH.adjectives[idx];
};

const adverb = function() {
  let idx = randomIdx(PARTS_OF_SPEECH.adverbs);
  return PARTS_OF_SPEECH.adverbs[idx];
};

const noun = function() {
  let idx = randomIdx(PARTS_OF_SPEECH.nouns);
  return PARTS_OF_SPEECH.nouns[idx];
};

const verb = function() {
  let idx = randomIdx(PARTS_OF_SPEECH.verbs);
  return PARTS_OF_SPEECH.verbs[idx];
};

const randomIdx = function(arr) {
  return Math.floor(Math.random() * arr.length);
};

const templateOne = function() {
  return `The ${noun()} ${verb()} a ${adjective()} ${noun()}.`;
};

const templateTwo = function() {
  return `The ${adjective()} ${noun()} ${verb()} ${adverb()}.`;
};

function madLibs(template) {
  return template();
}


export { madLibs, templateOne, templateTwo };