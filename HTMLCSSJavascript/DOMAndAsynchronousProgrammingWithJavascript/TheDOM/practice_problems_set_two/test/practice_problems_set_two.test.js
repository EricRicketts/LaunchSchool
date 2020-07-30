const fs = require('fs');
const path = require('path');
let jsdom = require('jsdom');
const { JSDOM } = jsdom;
import { extractTwoNumbers, multiplyTwoStringNumbers } from "../code/practice_problems_set_two";

describe('Launch School Practice Problems: The DOM', function () {
  let window, document, results, expected;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', '/code'); 
    let html = fs.readFileSync(codeDirectory + '/index.htm', 'utf8');
    window = new JSDOM(html).window;
    document = window.document;
  });

  describe('Some simple attribute changes', function () {
    it('add a class of "heading" to the h1 element', function () {
      let h1 = document.getElementById('primary_heading');
      h1.setAttribute('class', 'heading');
      expect(h1.getAttribute('class')).toBe('heading');
    });

    it('add a class of "bulleted" to the ul list', function () {
      document.getElementById('list').setAttribute('class', 'bulleted');
      expect(document.getElementById('list').getAttribute('class')).toBe('bulleted');
    });

    it('should update the multiplication paragraph to show the answer', function () {
      let targetParagraph = document.getElementById('multiplication');
      expected = [
        "What's 13 times 9?",
        "What's 13 times 9? It is 117."
      ];
      results = [targetParagraph.textContent];
      let paragraphNumbers = extractTwoNumbers(targetParagraph.textContent);
      let multiplyResults = multiplyTwoStringNumbers(paragraphNumbers);
      let textToAdd = document.createTextNode(` It is ${multiplyResults}.`);
      targetParagraph.insertAdjacentText('beforeend', textToAdd.wholeText);
      results.push(targetParagraph.textContent);
      expect(results).toEqual(expected);
    });

    it('set the id of the body element to "styled"', function () {
      expected = [null, '', '', 'styled', 'rgb(255, 255, 255)', 'rgb(204, 24, 62)'];
      let bodyElement = document.querySelector('body');
      let mainElement = document.querySelector('main');
      let h1Element = document.getElementById('primary_heading');
      results = [
        bodyElement.getAttribute('id'),
        window.getComputedStyle(mainElement).background,
        window.getComputedStyle(h1Element).color
      ];
      bodyElement.setAttribute('id', 'styled');
      let newStyling = [
        bodyElement.getAttribute('id'),
        window.getComputedStyle(mainElement).background,
        window.getComputedStyle(h1Element).color
      ];
      results.push(...newStyling);
      expect(results).toEqual(expected);
    });
  });

  describe('Manage some onclick requirements', function() {
    let firsOnClick;
    beforeEach(() => {
      firsOnClick = jest.fn().mockImplementation(function () {
        let targetDiv = document.getElementById('notice');
        if (targetDiv.getAttribute('class') === 'hidden') {
          targetDiv.setAttribute('class', 'visible');
        } else {
          targetDiv.setAttribute('class', 'hidden');
        }
      });
    });

    it('toggle the hidden div element', function() {
     let link = document.getElementById('toggle');
     link.setAttribute('onclick', 'firstOnClick()');
     expect(link.getAttribute('onclick')).toBe('firstOnClick()');
    });
  });
});