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
      it('appendChild inserts after last child', function () {
        let p = document.createElement('p');
        let text = document.createTextNode('This is another paragraph element.');
        p.appendChild(text);
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
        let p = document.createElement('p');
        let text = document.createTextNode('This is another paragraph element.');
        p.appendChild(text);
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
        let p = document.createElement('p');
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
  });
});