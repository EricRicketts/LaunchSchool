const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { childNodes } from "../code/child_nodes";

describe('Exercise Two', function () {
  let expected, results, window, document;
  beforeEach(() => {
    expected = {
      "1": { direct: 9, indirect: 12 }, "2": { direct: 2, indirect: 1 }, "3": { direct: 1, indirect: 0 },
      "4": { direct: 3, indirect: 1 }, "5": { direct: 1, indirect: 0 }, "6": { direct: 1, indirect: 1 },
      "7": { direct: 1, indirect: 0 }, "8": { direct: 1, indirect: 2 }, "9": { direct: 1, indirect: 1 },
      "10": { direct: 1, indirect: 0 },
    }
    let codeDirectory = path.join(__dirname, '..', 'code');
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let html = fs.readFileSync(codeDirectory + '/exercise_two.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
  });

  describe('Conventional Solution', function () {
    it('object contains all direct and indirect nodes', function () {
      results = childNodes(document)

      expect(results).toEqual(expected);
    });

    it('can ask for direct and indirect nodes for a given id', function () {
      expected = [[9, 12], [3, 1], [1, 1]];
      results = [childNodes(document, 1), childNodes(document, 4), childNodes(document, 9)];

      expect(results).toEqual(expected);
    });
  });
});