import { caesarEncrypt } from "../code/caesar_cipher";

describe('JS210 Interpretive Problem Solving Exercise Four', function () {
   let phrase, expected;
   it('should return the letter if key is zero', function () {
      expect(caesarEncrypt('A', 0)).toBe('A');
   });

   it('should convert "A" to "D" if key is three', function () {
      expect(caesarEncrypt('A', 3)).toBe('D');
   });

   it('should convert "y" to "d" if key is five', function () {
      expect(caesarEncrypt('y', 5)).toBe('d');
   });

   it('should convert "a" to "v" if key is forty-seven', function () {
      expect(caesarEncrypt('a', 47)).toBe('v');
   });

   it('should convert "A" to "Z" if key is twenty-five', function () {
      expect(caesarEncrypt('A', 25)).toBe('Z');
   });

   it('should convert two letters', function () {
      expect(caesarEncrypt('Ab', 25)).toBe('Za');
   });

   it('should convert the entire alphabet', function () {
      expected = 'ZABCDEFGHIJKLMNOPQRSTUVWXY';
      expect(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25)).toBe(expected);
   });

   it('should convert a normal phrase offset by five', function () {
      phrase = 'The quick brown fox jumps over the lazy dog!';
      expected = 'Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!';
      expect(caesarEncrypt(phrase, 5)).toBe(expected);
   });

   it('should convert a normal phrase offset by two', function () {
      phrase = 'There are, as you can see, many punctuations. Right?; Wrong?';
      expected = 'Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?';
      expect(caesarEncrypt(phrase, 2)).toBe(expected);
   });
});