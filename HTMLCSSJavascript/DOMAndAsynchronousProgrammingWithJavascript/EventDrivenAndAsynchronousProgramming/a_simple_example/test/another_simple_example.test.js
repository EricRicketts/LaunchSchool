const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Launch School A Simple Example', function () {
  let results, html, expected, window, document, output, addButton, resetButton;
  describe('Load Script In JSDOM Vice External Loading', function () {
    beforeEach(() => {
      let codeDirectory = path.join(__dirname, '..', 'code');
      html = fs.readFileSync(codeDirectory + '/main.html', 'utf8');
        let options = {
          resources: 'usable',
          runScripts: 'dangerously',
        };
        const dom = new JSDOM(html, options)
        dom.window.document.addEventListener('DOMContentLoaded', () => {
          // We need to delay one extra turn because we are the first DOMContentLoaded listener,
          // but we want to execute this code only after the second DOMContentLoaded listener
          // (added by external.js) fires.
          setImmediate(() => {
            console.log(dom.window.document.body.children.length) // Expecting to see `1`
            console.log(dom.window.document.body.innerHTML) // Expecting to see `<h1>Hello world</h1>`
          });
        });
      window = dom.window;
      document = window.document;
      output = document.getElementById('output');
      addButton = document.getElementById('add');
      resetButton = document.getElementById('reset');
    });

    it('should allow output to increment via the add button',  ()  => {
      expected = ["0", "1", "2"];
      results = [output.textContent];
      addButton.click();
      results.push(output.textContent);
      addButton.click();
      results.push(output.textContent);
      expect(results).toEqual(expected);
    });
  });
});