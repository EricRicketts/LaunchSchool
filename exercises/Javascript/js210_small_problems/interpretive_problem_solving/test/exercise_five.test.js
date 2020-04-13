import { vigenereEncrypt } from "../code/vigenere_cipher";

describe('JS210 Small Problems Interpretive Problem Solving Exercise Five', function () {
   let phrase, textKey, expected;
   beforeEach(() => {
     phrase = 'Pineapples don\'t go on pizzas!';
   });

   it('should encode a phrase with a four character text key', function () {
      textKey = 'meat';
      expected = 'Bmnxmtpeqw dhz\'x gh ar pbldal!';
      expect(vigenereEncrypt(phrase, textKey)).toBe(expected);
   });

   it('should return the phrase with a character text key of "A"', function () {
      textKey = 'A';
      expect(vigenereEncrypt(phrase, textKey)).toBe(phrase);
   });

   it('should return phrase with a two character text key of "Aa"', function () {
      textKey = 'Aa';
      expect(vigenereEncrypt(phrase, textKey)).toBe(phrase);
   });

   it('should encode a phrase with a three character text key', function () {
      textKey = 'cab';
      expected = 'Riogaqrlfu dpp\'t hq oo riabat!';
      expect(vigenereEncrypt(phrase, textKey)).toBe(expected);
   });

   it('should encode a phrase where text key is longer than phrase', function () {
      phrase = 'Dog';
      textKey = 'Rabbit';
      expected = 'Uoh';
      expect(vigenereEncrypt(phrase, textKey)).toBe(expected);
   });
});