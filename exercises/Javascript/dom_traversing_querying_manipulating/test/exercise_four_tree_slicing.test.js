const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { sliceTree } from "../code/tree_slicing";

describe('Exercise Four Tree Slicing', function () {
  let results, expected, window, document;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    }; 
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/exercise_four.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
  });

  it('first number is top level element, second number is inner most element', function () {
    expected = ['ARTICLE', 'HEADER', 'SPAN', 'A'];

    expect(sliceTree(document, 1, 4)).toEqual(expected);
  });

  it('if either start or end numbers are not ids in the DOM return undefined', function () {
    expect(sliceTree(document, 1, 76)).toBeUndefined();
  });

  it('if there is not a path from start to end in the sliced DOM Tree return undefined', function () {
    results = [sliceTree(document, 2, 5), sliceTree(document, 5, 4)];
    expected = [undefined, undefined];
    
    expect(results).toEqual(expected);
  });

  it('The end index does not have to be the innermost child', function () {
    expected = ['ARTICLE', 'FOOTER'];
    
    expect(sliceTree(document, 1, 23)).toEqual(expected);
  });

  it('if there is a legitimate inner element the results slice from parent to child', function () {
    expected = [
      ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"],
      ["SECTION", "P", "SPAN", "STRONG", "A"]
    ];
    results = [
      sliceTree(document, 1, 22), sliceTree(document, 11, 19)
    ];

    expect(results).toEqual(expected);
  });
});