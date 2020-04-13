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
});