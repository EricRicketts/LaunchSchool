const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { nodeSwap } from "../code/node_swap";

describe('Exercise Six Node Swap', function () {
  let results, expected, window, document;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    }; 
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/exercise_six.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
  });

  it('should return undefined if either of the ids do not exist', function () {
    expect(nodeSwap(document, 1, 20)).toBeUndefined();
  });

  it('should return undefined if neither elements are siblings of one another', function () {
    results = [nodeSwap(document, 1, 4), nodeSwap(document, 9, 3)];
    expected = [undefined, undefined];

    expect(results).toEqual(expected);
  });

  it('should return true if swapped was executed', function () {
    expect(nodeSwap(document, 3, 1)).toBe(true);
  });

  it('should actually swap nodes if the return is true', function () {
    expected = ["7", "9"];
    results = [
      document.getElementById('3').firstElementChild.getAttribute('id'),
      document.getElementById('3').lastElementChild.getAttribute('id')
    ];
    expect(results).toEqual(expected);
    nodeSwap(document, 7, 9);
    results = [
      document.getElementById('3').firstElementChild.getAttribute('id'),
      document.getElementById('3').lastElementChild.getAttribute('id')
    ];
    expected = ["9", "7"];
    expect(results).toEqual(expected);
  });
});