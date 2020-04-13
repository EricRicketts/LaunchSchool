import { caesarEncrypt } from "./caesar_cipher";

function getKey(textKey, textKeyIndex) {
  let letterArray = [...Array(26)].map((_, i) => String.fromCharCode('A'.charCodeAt(0) + i));
  let letterKey = textKey[textKeyIndex].toUpperCase();

  return letterArray.indexOf(letterKey);
}

function vigenereEncrypt(phrase, textKey) {
  let nonLetterRegex = /[^a-zA-Z]/;
  let phraseSize = phrase.length;
  let phraseIndex = 0;
  let textKeySize = textKey.length;
  let textKeyIndex = 0;
  let encryptedPhrase = '';

  while (phraseIndex < phraseSize) {
    let currentLetter = phrase[phraseIndex];

    if (nonLetterRegex.test(currentLetter)) {
      encryptedPhrase += currentLetter;
    } else {
      encryptedPhrase += caesarEncrypt(currentLetter, getKey(textKey, textKeyIndex));
      textKeyIndex = (textKeyIndex + 1) % textKeySize;
    }

    phraseIndex += 1;
  }

  return encryptedPhrase;
}

export { vigenereEncrypt };