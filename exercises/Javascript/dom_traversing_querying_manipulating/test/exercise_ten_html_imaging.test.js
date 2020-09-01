import {doubleConsonants} from "../../js210_small_problems/easy5/code/double_char_part_two";

const fs = require('fs');
const path = require('path');
const beautify = require('js-beautify').html
const { JSDOM } = require('jsdom');

describe('Exercise Ten HTML Imaging', function () {
  let codeDirectory, options, html, window, document,
    results, expected, testHTML, testWindow, testDocument;
  beforeEach(() => {
    options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    codeDirectory = path.join(__dirname, '..', 'code');
  });

  describe('First Iteration', function () {
    beforeEach(() => {
      html = fs.readFileSync(codeDirectory + '/exercise_ten_a.html', 'utf8'); 
      window = new JSDOM(html, options).window;
      document = window.document;
      testHTML = fs.readFileSync(codeDirectory + '/exercise_ten_b.html', 'utf8');
      testWindow = new JSDOM(testHTML, options).window;
      testDocument = testWindow.document;
    });

    it('should have header element with text and a paragraph child element', function () {
      const node1 = document.createElement('header');
      const node2 = document.createTextNode('Dynamic Content');
      node1.innerHTML = '<p>Hello World!</p>';
      document.body.appendChild(node1);
      document.body.firstElementChild.insertBefore(node2, node1.firstElementChild);

      const node3 = document.createElement('h1');
      node3.appendChild(node2);
      document.body.firstElementChild.insertBefore(node3, node1.firstElementChild);

      expect(testDocument.body.innerHTML.trim()).toBe(document.body.innerHTML.trim())
    });
  });

  describe('Second Iteration', function () {
    beforeEach(() => {
      html = fs.readFileSync(codeDirectory + '/exercise_ten_b.html', 'utf8');
      window = new JSDOM(html, options).window;
      document = window.document;
      testHTML = fs.readFileSync(codeDirectory + '/exercise_ten_c.html', 'utf8');
      testWindow = new JSDOM(testHTML, options).window;
      testDocument = testWindow.document;
    });

    it('should complete the html with the following additions', function () {
      const node1 = document.querySelector('header');
      const node3 = document.querySelector('h1');
      const node4 = document.createElement('style');

      node1.setAttribute('id', 'header')
      node3.classList.add('emphasis');
      node3.classList.add('light');

      const css1 = ".emphasis { font-weight: bold; } ";
      const css2 = ".light { color: grey; }";
      node4.setAttribute("type", "text/css");

      node4.appendChild(document.createTextNode(css1));
      node4.appendChild(document.createTextNode(css2));
      document.head.appendChild(node4);

      expected = [
        document.head.innerHTML.trim(), document.body.innerHTML.trim()
      ];
      results = [
        testDocument.head.innerHTML.trim(), testDocument.body.innerHTML.trim()
      ];

      expect(results).toEqual(expected);
    });
  });
});