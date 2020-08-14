const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Capturing And Bubbling Part One', function () {
  let expected, results, codeDirectory, html, options, window, document;
  beforeEach(() => {
    codeDirectory = path.join(__dirname, '..', 'code');
    options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
  });
  describe('Problem One', function () {
    let targetArr, elem1, elem4;
    beforeEach(() => {
      html = fs.readFileSync(codeDirectory + '/practice_one.html', 'utf8');
      window = new JSDOM(html, options).window;
      document = window.document;
      targetArr = [];
      elem1 = document.getElementById('elem1');
      elem4 = document.getElementById('elem4');
      let eventHandler = function(event) {
        if (event) {
          targetArr.push(event.currentTarget.id);
        }
      }
      elem1.addEventListener('click', eventHandler, true);
      elem4.addEventListener('click', eventHandler, false);
    });

    it('clicking on element one only registers one event handler', function () {
      elem1.click();
      expected = ['elem1'];
      expect(targetArr).toEqual(expected);
    });

    it('clicking on element four registers two event handlers', function () {
      elem4.click();
      expected = ['elem1', 'elem4'];
      expect(targetArr).toEqual(expected);
    });
  });
  describe('Problem Two', function () {
    let divs, highlightThis, section;
    beforeEach(() => {
      results = [];
      highlightThis = function(event) {
        results.push([this.className, event.currentTarget.tagName]);
      }
      html = fs.readFileSync(codeDirectory + '/practice_two.html', 'utf8');
      window = new JSDOM(html, options).window;
      document = window.document;
      divs = document.querySelectorAll('.pick');
      for (let index = 0; index < divs.length; index += 1) {
        divs[index].addEventListener('click', highlightThis, true);
      }
      section = document.querySelector('section');
    });

    it('click on inner most element should yield listeners from outer to inner', function () {
      expected = [['d1 pick', 'DIV'], ['d2 pick', 'MAIN'], ['d4 pick', 'SECTION']];
      section.click();
      expect(results).toEqual(expected);
    });

    it('add a listener on d3 now all four elements register', function () {
      document.querySelector('.d3').addEventListener('click', highlightThis, false);
      expected = [['d1 pick', 'DIV'], ['d2 pick', 'MAIN'], ['d4 pick', 'SECTION'], ['d3', 'DIV']];
      section.click();
      expect(results).toEqual(expected);
    });
  });

  describe('Problem Three', function () {
    let elem0, elem1, elem4, recordEvent;
    beforeEach(() => {
      results = [];
      recordEvent = function(event) {
        results.push(event.currentTarget.id);
      }
      html = fs.readFileSync(codeDirectory + '/practice_three.html', 'utf8');
      window = new JSDOM(html, options).window;
      document = window.document;
      elem0 = document.querySelector('#elem0');
      elem1 = document.querySelector('#elem1');
      elem4 = document.querySelector('#elem4');

      elem0.addEventListener('click', recordEvent);
      elem1.addEventListener('click', recordEvent, true);
      elem4.addEventListener('click', recordEvent);
    });

    it('click on inner most div list outer first then inner', function () {
      elem4.click();
      expected = ['elem1', 'elem4'];
      expect(results).toEqual(expected);
      // only two listeners will be registered because #elem0 is a sibling to #elem0, so it is not in
      // the capturing or bubbling hierarchy
    });
  });
});
