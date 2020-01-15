function reverseSentence(sentence) {
 return sentence.slice().split(/\s+/).reverse().join(' ');
}

export { reverseSentence };