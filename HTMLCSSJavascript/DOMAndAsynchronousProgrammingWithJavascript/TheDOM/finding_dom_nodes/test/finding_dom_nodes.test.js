import { walkTree } from "../code/finding_dom_nodes";
let fs = require('fs');
let path = require('path');
let jsdom = require('jsdom');
const { JSDOM } = jsdom;

describe('Finding DOM Nodes Assignment', function () {
  let codeDirectory, firstHTML, secondHTML, window, document, results, expected;
  beforeEach(() => {
    codeDirectory = path.join(__dirname, '..', '/code');
  })
  describe('Problem Group One', function () {
    beforeEach(() => {
      firstHTML = fs.readFileSync(codeDirectory + '/first.html', 'utf8');
      secondHTML = fs.readFileSync(codeDirectory + '/second.html', 'utf8');
    });

    it('return the last two paragraph elements', function () {
      window = new JSDOM(firstHTML).window;
      document = window.document;
      results = Array.from(document.getElementsByTagName('p')).filter(function(element) {
        return !element.hasAttribute('id');
      }).map(function(element) {
        return element.textContent;
      });
      expected = ['More of this sun is low', 'The waters flow'];
      expect(results).toEqual(expected);
    });

    it('adds class "article-text" to every paragraph element', function () {
      window = new JSDOM(secondHTML).window;
      document = window.document;
      let paragraphs = document.getElementsByTagName('p');
      Array.from(paragraphs).forEach(function(element) {
        return element.setAttribute('class', 'article-text');
       });
       expected = Array.from(paragraphs).every(paragraph => paragraph.getAttribute('class') === 'article-text');
       expect(expected).toBe(true);
    });

    it('perform the same operation with just nodes', function () {
      window = new JSDOM(secondHTML).window;
      document = window.document;
      function setClassAttribute(node, value) {
        if (node.nodeName === 'P') {
          node.classList.add(value);
        }
      }
      walkTree(document.body, setClassAttribute, 'article-text');
      expected = Array.from(document.getElementsByTagName('p')).every(function(paragraph) {
        return paragraph.getAttribute('class') === 'article-text';
      });
      expect(expected).toBe(true);
    });
  });

  describe('Problem Group Two', function () {
    beforeEach(() => {
      let secondHTML = fs.readFileSync(codeDirectory + '/second.html', 'utf8');   
      window = new JSDOM(secondHTML).window;
      document = window.document;
    });

    it('just put class attribute on paragraphs within divs with "intro" class', function () {
      let divs = document.getElementsByClassName('intro');
      Array.from(divs).forEach(div => {
        let childNodes = div.childNodes;
        for (let index = 0; index < childNodes.length; index += 1) {
          if (childNodes[index].nodeName === 'P') {
            childNodes[index].classList.add('article-text');
          }
        }
      });
      expected = Array.from(document.getElementsByTagName('p')).filter(function(paragraph) {
        return paragraph.getAttribute('class') === 'article-text'
          && paragraph.parentNode.className === 'intro';
      });
      expect(expected.length).toBe(3);
    });

    it('rewrite the above solution using getElementByTagName', function () {
      let divs = document.getElementsByClassName('intro');
      Array.from(divs).forEach(div => {
        let paragraphs = div.getElementsByTagName('p');
        Array.from(paragraphs).forEach(paragraph => {
          paragraph.setAttribute('class', 'article-text');
        });
      });
      expected = Array.from(document.getElementsByTagName('p')).filter(function(paragraph) {
        return paragraph.getAttribute('class') === 'article-text'
          && paragraph.parentNode.className === 'intro';
      });
      expect(expected.length).toBe(3);
    });

    it('rewrite the above using querySelectorAll', function () {
      Array.from(document.querySelectorAll('.intro > p')).forEach(paragraph => {
        paragraph.classList.add('article-text');
      });
      expected = Array.from(document.getElementsByTagName('p')).filter(function(paragraph) {
        return paragraph.getAttribute('class') === 'article-text'
          && paragraph.parentNode.className === 'intro';
      });
      expect(expected.length).toBe(3);
    });
  });
});