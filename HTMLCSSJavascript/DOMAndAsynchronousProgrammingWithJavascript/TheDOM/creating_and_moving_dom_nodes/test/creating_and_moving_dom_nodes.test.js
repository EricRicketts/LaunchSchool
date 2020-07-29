const fs = require('fs');
const path = require('path');
let jsdom = require('jsdom');
const { JSDOM } = jsdom;

describe('Creating, Moving, and Deleting DOM Nodes Assignment', function () {
  let document, results, expected; 
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', '/code'); 
    let html = fs.readFileSync(codeDirectory + '/index.html');
    let window = new JSDOM(html).window;
    document = window.document;
  });

  describe('Creating And Adding Nodes To The DOM', function () {
    describe('Using appendChild, insertBefore, and replaceChild', function () {
      let p;
      beforeEach(() => {
        p = document.createElement('p');
        let text = document.createTextNode('This is another paragraph element.');
        p.appendChild(text);
      });
      it('appendChild inserts after last child', function () {
        document.body.appendChild(p);
        expected = [2, 'P', 'This is another paragraph element.'];
        results = [
          document.querySelectorAll('body > p').length,
          document.body.lastChild.nodeName,
          document.body.lastChild.textContent
        ];
        expect(results).toEqual(expected);
      });

      it('insertBefore first paragraph in body', function () {
        let currentParagraph = document.querySelector('body > p');
        document.body.insertBefore(p, currentParagraph);
        expected = [2, 'P', 'This is another paragraph element.'];
        results = [
          document.querySelectorAll('body > p').length,
          document.body.children.item(1).nodeName,
          document.body.children.item(1).textContent
        ];
        expect(results).toEqual(expected);
      });

      it('replaceChild to replace current paragraph', function () {
        p = document.createElement('p');
        let text = document.createTextNode('This is the replacement paragraph.');
        p.appendChild(text);
        let currentParagraph = document.querySelector('body > p');
        document.body.replaceChild(p, currentParagraph);
        expected = [1, 'P', 'This is the replacement paragraph.'];
        results = [
          document.querySelectorAll('body > p').length,
          document.body.children.item(1).nodeName,
          document.body.children.item(1).textContent
        ];
        expect(results).toEqual(expected);
      });
    });

    describe('Using insertAdjacentElement and insertAdjacentText', function () {
      let newP, newLi, ul, currentParagraph;
      beforeEach(() => {
        newP = document.createElement('p');
        let text = document.createTextNode('This is the text for the new paragraph.');
        newP.appendChild(text);
        newLi = document.createElement('li');
        text = document.createTextNode('This is the text for the new list element.');
        newLi.appendChild(text);
        ul = document.getElementById('ul-list');
        currentParagraph = document.querySelector('p');
      });

      it('insert paragraph before the unordered list', function () {
        expected = [2, newP.textContent];
        ul.insertAdjacentElement('beforebegin', newP);
        results = [
          document.querySelectorAll('body > p').length,
          ul.previousSibling.textContent
        ];
        expect(results).toEqual(expected);
      });

      it('insert paragraph after the unordered list', function () {
        expected = [2, newP.textContent];
        ul.insertAdjacentElement('afterend', newP);
        results = [
          document.querySelectorAll('body > p').length,
          ul.nextSibling.textContent
        ];
        expect(results).toEqual(expected);
      });

      it('insert new list element before first list element', function () {
        expected = [4, newLi.textContent];
        ul.insertAdjacentElement('afterbegin', newLi);
        results = [
          ul.querySelectorAll('li').length,
          ul.firstElementChild.textContent
        ];
        expect(results).toEqual(expected);
      });

      it('insert new list element after last list element', function () {
        expected = [4, newLi.textContent];
        ul.insertAdjacentElement('beforeend', newLi);
        results = [
          ul.querySelectorAll('li').length,
          ul.lastElementChild.textContent
        ];
        expect(results).toEqual(expected);
      });

      it('insert new text before current paragraph text', function () {
        expected = [
          'This is a single paragraph element.',
          'This comes before the current paragraph text. This is a single paragraph element.'
        ];
        results = [currentParagraph.textContent];
        let newText = 'This comes before the current paragraph text. ';
        currentParagraph.insertAdjacentText('afterbegin', newText);
        results.push(currentParagraph.textContent);
        expect(results).toEqual(expected);
      });

      it('insert new text after current paragraph text', function () {
        expected = [
          'This is a single paragraph element.',
          'This is a single paragraph element. This comes after the current paragraph text.'
        ];
        results = [currentParagraph.textContent];
        let newText = ' This comes after the current paragraph text.';
        currentParagraph.insertAdjacentText('beforeend', newText);
        results.push(currentParagraph.textContent);
        expect(results).toEqual(expected);
      });
    });
  });
});