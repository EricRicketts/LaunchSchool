const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { arrayToNodes } from "../code/array_to_nodes";

describe('Exercise Eight Array to Nodes', function () {
  let firstArray, secondArray, actual, expected;
  beforeEach(() => {
    firstArray = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];
    secondArray = ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]];
  });

  it('should return HTML with no child nodes except those under the body element', function () {
    actual = arrayToNodes(firstArray);
    let document = new JSDOM('<body><header></header><main></main><footer></footer></body>').window.document;
    let expected = document.body;
    expect(actual.outerHTML).toBe(expected.outerHTML);
  });

  it('should return HTML with child nodes of child nodes', function () {
    actual = arrayToNodes(secondArray);
    let domString = '<body><div><div></div><div><div></div></div></div><div></div><div><div></div><div></div><div></div></div></body>';
    let document = new JSDOM(domString).window.document;
    let expected = document.body;
    expect(actual.outerHTML).toBe(expected.outerHTML);
  });
});