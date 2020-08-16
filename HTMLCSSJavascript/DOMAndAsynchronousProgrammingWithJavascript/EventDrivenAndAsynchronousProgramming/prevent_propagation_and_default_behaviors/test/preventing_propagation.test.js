const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Preventing Propagation', function () {
  let expected, results, codeDirectory, html, options, window, document, inner, outer;
  let scriptContent, scriptTag;
  beforeEach(() => {
    codeDirectory = path.join(__dirname, '..', 'code');
    html = fs.readFileSync(codeDirectory + '/index.html', 'utf8');
    options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    window = new JSDOM(html, options).window;
    document = window.document;
    inner = document.body.querySelector('.inner');
    outer = document.body.querySelector('.outer');
  });

  describe('Normal Propagation', function () {
    beforeEach(() => {
      function turnRed(event) {
        event.currentTarget.style.background = 'red';
      }
      inner.addEventListener('click', turnRed);
      outer.addEventListener('click', turnRed);
    })
    it('normal propagation means click on inner sets both inner and outer to red', function () {
      expected = ['red','red'];
      inner.click();
      results = [inner.style.background, outer.style.background];
      expect(results).toEqual(expected);
      /*
      We can see from the HTML and the DOM code in the beforeEach block that if the inner div element is
      clicked then the color will also turn red on the outer div element, this is because the outer div
      element has a listener on it so as the event propagates from inner to outer during the bubbling
      phase, it will reach the event listener on the outer div element and then invoke it.
       */
    });

    it('normal propagation clicking on outer only turns outer red', function () {
      expected = ['', 'red', 'lightblue'];
      outer.click();
      results = [inner.style.background, outer.style.background, window.getComputedStyle(inner).background];
      expect(results).toEqual(expected);
      /*
      In this case only the outer div element gets changed because the propagation of the event stops at
      the outer element and never reaches the inner element.
       */
    });
  });

  describe('Stop Propagation', function () {
    beforeEach(() => {
      function turnRed(event) {
        event.stopPropagation();
        event.currentTarget.style.background = 'red';
      }
      document.querySelector('.inner').addEventListener('click', turnRed);
      document.querySelector('.outer').addEventListener('click', turnRed);
    });

    it('with the stopPropagation on bubbling will not take place after the click event', function () {
      expected = ['red', 'lightblue'];
      inner.click();
      results = [inner.style.background, window.getComputedStyle(outer).background];
      expect(results).toEqual(expected);
      /*
        In this case one can see with put the stopPropagation call in the turnRed function.  Now what happens is
        that once the event occurs on the inner element, the event does not proceed up the element hierarchy to
        the outer element, thus only the inner element will turn red.
      */
    });

    it('stopPropagation has no effect on outer element behavior', function () {
      expected = ['', 'lightblue', 'red'];
      outer.click();
      results = [inner.style.background, window.getComputedStyle(inner).background, outer.style.background];
      expect(results).toEqual(expected);
      /*
        The stopPropagation function does not change the behavior of the outer element as the event
        propagation, both going down the capture path and going up the bubbling path with terminate and
        start with the outer element.
      */
    });
  });

  describe('Outer Element Only', function () {
    beforeEach(() => {
      const turnRed = (event => {
        event.stopPropagation();
        event.currentTarget.style.background = 'red';
      });
      document.querySelector('.outer').addEventListener('click', turnRed, true);
      document.querySelector('.inner').addEventListener('click', turnRed);
    });

    it('stopPropagation combined with the outer event listener on capture phase', function () {
      expected = ['', 'lightblue', 'red'];
      inner.click();
      results = [inner.style.background, window.getComputedStyle(inner).background, outer.style.background];
      expect(results).toEqual(expected);
    });
  });
});