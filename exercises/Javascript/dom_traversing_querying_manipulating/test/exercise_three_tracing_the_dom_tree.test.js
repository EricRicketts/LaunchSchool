const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { domTreeTracer } from "../code/tracing_the_dom_three";

describe('Exercise Three Tracing The DOM Tree', function () {
  let expected, window, document;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/exercise_three.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
  });

  it('should return only one tagName for top level element', function () {
    expected = [['ARTICLE']];

    expect(domTreeTracer(document, 1)).toEqual(expected);
  });

  it('should return two levels of hierarchy for and id of two', function () {
    expected = [['HEADER', 'MAIN', 'FOOTER'], ['ARTICLE']];

    expect(domTreeTracer(document, 2)).toEqual(expected);
  });

  it('should many levels of hierarchy for an id in the middle of the markup', function () {
    expected = [
      ["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"],
      ["MAIN", "FOOTER", "HEADER"], ["ARTICLE"]
    ];

    expect(domTreeTracer(document, 22)).toEqual(expected)
  });
});