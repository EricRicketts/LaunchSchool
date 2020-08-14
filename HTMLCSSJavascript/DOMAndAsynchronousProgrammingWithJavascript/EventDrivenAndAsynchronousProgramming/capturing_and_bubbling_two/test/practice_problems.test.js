const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Capturing And Bubbling Part Two', function () {
  let results, expected, codeDirectory, options, html, window, document, elem1, elem4;
  beforeEach(() => {
    codeDirectory = path.join(__dirname, '..', 'code');
    options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    results = [];
    html = fs.readFileSync(codeDirectory + '/problem.html', 'utf8');
    window = new JSDOM(html, options).window
    document = window.document;
    elem1 = document.querySelector('#elem1');
    elem4 = document.querySelector('#elem4');
  });
  describe('Practice Problem One', function () {
    beforeEach(() => {
      elem1.addEventListener('click', event => results.push(event.target.tagName));
      elem1.addEventListener('click', event => results.push(event.currentTarget.tagName));
    });

    it('inner element should register first then the outer element', function () {
      elem4.click();
      expected = ['MAIN', 'DIV'];
      expect(results).toEqual(expected);
      // there are two event listeners registered on the same element, element 1.  It does not matter if the
      // same event type, 'click' is registered twice, one does not overwrite the other, there are two events
      // registered.  When the user clicks on the inner most element, element 4 then the event propogates until
      // it reaches a registered event listener.  So in this case the event propagates upward to element 1
      // where there are two event listeners registered.  So the first event listener is invoked and the
      // event target is pushed ont the results array, in this case the tagName of the event target is
      // MAIN.  The the second event listener is invoked and the tagName of the currentTarget is pushed onto
      // the results array.  The currentTarget is always the element which as the event listener attached to it.
      // In this case the tagName is DIV.  So, to recap the event occurred on the inner most element, element 4
      // and bubbled up to element 1 where two event listeners were attached to the element.
    });
  });

  describe('Practice Problem Two', function () {
    beforeEach(() => {
      results = [];
      elem1.addEventListener('click', event => results.push('bubbling'));
      elem1.addEventListener('click', event => results.push('capturing'), true);
    });

    it('capturing phase takes place before bubbling phase', function () {
      expected = ['capturing', 'bubbling'];
      elem4.click();
      expect(results).toEqual(expected);
      /*
        As before two events handlers are registered on element 1.  The actual event occurred on element 4.  The
        event was dispatched first along the capture phase.  When it reached element 1, the event handler was
        invoked and pushed the "capturing" string onto the results array.  The the event propagation along the
        capture path stopped at element 4 which was the event target.  It then started up the bubbling path
        and again reached element 1 where the event listener for along that path was the invoked.  So "bubbling"
        was pushed onto the results array.
      */
    });
  });

  describe('Practice Problem Three', function () {
    let input;
    beforeEach(() => {
      jest.useFakeTimers();
      results = [];
      input = document.querySelector('input');
      document.addEventListener('keydown', event => {
        setTimeout(() => results.push(event.code), 7000);
      });
      document.addEventListener('keyup', event => {
        setTimeout(() => results.push(event.code), 7000);
      });
      elem1.addEventListener('click', event => {
        setTimeout(() => results.push(event.target.tagName), 7000); 
      });
    });

    it('delays before registering keypresses', function () {
      let qKey = { 'key': 'q', 'code': 'KeyQ', 'bubbles': true };
      let wKey = { 'key': 'w', 'code': 'KeyW', 'bubbles': true };
      let event1 = new window.KeyboardEvent('keydown', qKey);
      let event2 = new window.KeyboardEvent('keyup', qKey);
      let event3 = new window.KeyboardEvent('keydown', wKey);
      let event4 = new window.KeyboardEvent('keyup', wKey);
      expected = ['DIV', 'KeyQ', 'KeyQ', 'KeyW', 'KeyW', 'MAIN'];
      elem1.click();
      input.focus();
      input.dispatchEvent(event1);
      input.dispatchEvent(event2);
      input.dispatchEvent(event3);
      input.dispatchEvent(event4);
      elem4.click();
      jest.runAllTimers();
      expect(results).toEqual(expected);
    });
  });
});