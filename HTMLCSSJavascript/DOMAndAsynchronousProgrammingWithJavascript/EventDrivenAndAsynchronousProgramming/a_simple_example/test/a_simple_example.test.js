const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { setUpListeners, elementsWithListeners } from "../code/a_simple_example";

describe('Running the simple example with external scripts', function () {
  let results, expected, window, document, output, addButton, resetButton;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/index.html', 'utf8');
    window = new JSDOM(html).window;
    document = window.document;
    setUpListeners(document);
    [output, addButton, resetButton] = elementsWithListeners(document);
  });

  it('should advance the count when clicked', function () {
    expected = ["0", "1"];
    results = [output.textContent];
    addButton.click();
    results.push(output.textContent)
    expect(results).toEqual(expected);
  });

  it('should reset the count when clicked', function () {
    expected = ["0", "1", "2", "0", "1"];
    results = [output.textContent];
    for (let i = 0; i < 2; i += 1) {
      addButton.click();
      results.push(output.textContent);
    }
    resetButton.click();
    results.push(output.textContent);
    addButton.click();
    results.push(output.textContent);
    expect(results).toEqual(expected);
  });
});