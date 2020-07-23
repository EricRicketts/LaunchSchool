import * as fs from 'fs';
import * as path from 'path';
import { nodeArray, callBackFn, walk } from "../code/traversing";
const jsdom = require('jsdom');
const { JSDOM } = jsdom;

describe('Traverse HTML', function () {
  let htmlSource, document, expected, results;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    htmlSource = fs.readFileSync(codeDirectory + '/traversing.html', 'utf8');
    let window = new JSDOM().window;
    document = window.document
    document.body.innerHTML = htmlSource;
  });

  it('should have access to the loaded html', function () {
    expect(document.getElementById('heading').constructor.name).toBe('HTMLHeadingElement');
  });

  it('should traverse a DOM hierarchy', function () {
    walk(document.body, callBackFn);
    expected = [true, true];
    let numberTextNodes = nodeArray.filter((nodeName) => nodeName === 'Text').length;
    results = [nodeArray.length > 18, (numberTextNodes < 14 && numberTextNodes > 5)];
    expect(results).toEqual(expected);
  });
});