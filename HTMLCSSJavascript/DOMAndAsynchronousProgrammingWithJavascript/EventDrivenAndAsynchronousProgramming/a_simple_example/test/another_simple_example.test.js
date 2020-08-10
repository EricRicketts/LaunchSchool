const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Launch School A Simple Example', function () {
  let results, dom, html, expected, window, document, output, addButton, resetButton;
  describe('Load Script In JSDOM Vice External Loading', function () {
    beforeEach( async () => {
      let codeDirectory = path.join(__dirname, '..', 'code');
      html = fs.readFileSync(codeDirectory + '/main.html', 'utf8');
      let options = {
        resources: 'usable',
        runScripts: 'dangerously',
      };
      let scriptContent = fs.readFileSync(codeDirectory + '/simple_example_launch_school.js', 'utf8');
      dom = new JSDOM(html, options);
      window = dom.window;
      document = window.document;
      let scriptElement = document.createElement('script');
      scriptElement.textContent = scriptContent;
      document.head.appendChild(scriptElement);
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

    it('the reset button should reset the element', function () {
      expected = ["0", "1", "2", "0", "1"];
      results = [output.textContent];
      addButton.click();
      results.push(output.textContent);
      addButton.click();
      results.push(output.textContent);
      resetButton.click();
      results.push(output.textContent);
      addButton.click();
      results.push(output.textContent);
      expect(results).toEqual(expected);
    });
  });
});