function myName(str) {
  let lastIndex = str.length - 1;
  let screamStr = str.toUpperCase().substring(0, lastIndex);
  let normalGreeting = 'Hello '.concat(str, '.');
  let loudGreeting = 'HELLO '.concat(screamStr, '.  WHY ARE WE SCREAMING?');

  return str.endsWith('!') ? loudGreeting : normalGreeting;
}

export { myName };