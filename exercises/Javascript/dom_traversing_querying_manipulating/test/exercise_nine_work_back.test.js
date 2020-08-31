const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Exercise Nine Work Back', function () {
  let results, expected, options, html, codeDirectory, window, document;
  beforeEach(() => {
    options = {
      resources: 'usable',
      runScripts: 'dangerously'
    }; 
    codeDirectory = path.join(__dirname, '..', 'code');
  });

  describe('First Iteration', function () {
    beforeEach(() => {
      html = fs.readFileSync(codeDirectory + '/exercise_nine_a.html', 'utf8');
      window = new JSDOM(html, options).window;
      document = window.document;
    });

    it('head element should have a title body has three children', function () {
      let regex = /\s+Title\s+/;
      expected = [3, 'TITLE', true, 3, 5];
      results = [
        document.head.childNodes.length, document.head.children[0].tagName,
        regex.test(document.head.textContent), document.body.children.length,
        document.body.childNodes.length
      ];

      expect(results).toEqual(expected);
    });
  });

  describe('Second Iteration', function () {
    beforeEach(() => {
      html = fs.readFileSync(codeDirectory + '/exercise_nine_b.html', 'utf8');
      window = new JSDOM(html, options).window;
      document = window.document;
    });

    it('should be one div with a section child which itself has three children', function () {
      expected = ['BODY', null, 1];
      results = [
        document.querySelector('div').parentNode.parentNode.tagName,
        document.querySelector('div section').children[2].nextElementSibling,
        document.querySelectorAll('div').length
      ];

      expect(results).toEqual(expected);
    });

    it('swap the footer with the header', function () {
      let nodeA = document.body.firstElementChild;
      expected = [1, 'HEADER', nodeA, document.querySelector('footer')];
      results = [
        document.querySelector('footer').children.length,
        document.querySelector('body').replaceChild(document.querySelector('footer'),
          document.body.firstElementChild).tagName
      ];
      document.body.appendChild(nodeA);
      results.push(document.body.lastElementChild, document.body.firstElementChild);

      expect(results).toEqual(expected);
    });
  });

  describe('Third Iteration', function () {
    beforeEach(() => {
      html = fs.readFileSync(codeDirectory + '/exercise_nine_c.html', 'utf8');
      window = new JSDOM(html, options).window;
      document = window.document;
    });

    it('should grab all of the text content under the section element', function () {
      expected = [['H1', 'Hello', 'World'], ['H1', 'P', 'P'], true]
      let regex = /\s+H1\s+Hello\s+World\s+/;
      let trimmedText = document.querySelector('section').textContent.split('\n').map(function(text) {
        return text.trim();
      }).filter(function(text) {
        return text.length > 0;
      });
      results = [trimmedText];
      let sectionChildrenArray = Array.from(document.querySelector('section').children).reduce((children, element) => {
        children.push(element.tagName);
        return children;
      }, []);
      results.push(sectionChildrenArray);
      results.push(regex.test(document.querySelector('section').textContent));

      expect(results).toEqual(expected);
    });

    it('footer has span with class emphasis', function () {
      expect(document.querySelector('span.emphasis').parentNode.tagName).toBe('FOOTER');
    });
  });
});