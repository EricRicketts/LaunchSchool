const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { colorGeneration } from "../code/coloring";

describe('Exercise Five Coloring', function () {
  let expected, results, window, document, allElementsWithIDs, findElementsWithColoring;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/exercise_five.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    findElementsWithColoring = function(HTMLCollection) {
      let coloredElements = [];
      Array.from(HTMLCollection).forEach(element => {
        if (Array.from(element.classList).includes('generation-color')) {
          coloredElements.push(element.getAttribute('id'));
        }
      });

      return coloredElements;
    }
  });

  it('should only highlight one square if the depth is one', function () {
    expected = ['1'];
    colorGeneration(document.body, 1);
    allElementsWithIDs = document.querySelectorAll('[id]');
    results = findElementsWithColoring(allElementsWithIDs);

    expect(results).toEqual(expected);
  });

  it('should color squares 4, 7, 12, 16 with a depth of 4', function () {
    expected = ['4', '7', '12', '16'];
    colorGeneration(document.body, 4);
    allElementsWithIDs = document.querySelectorAll('[id]');
    results = findElementsWithColoring(allElementsWithIDs);

    expect(results).toEqual(expected);
  });

  it('should color squares 10, 15, 19, 22 with a depth of 7', function () {
    expected = ['10', '15', '19', '22'];
    colorGeneration(document.body, 7);
    allElementsWithIDs = document.querySelectorAll('[id]');
    results = findElementsWithColoring(allElementsWithIDs);

    expect(results).toEqual(expected);
  });

  it('should color no squares with a depth of 8', function () {
    expected = [];
    colorGeneration(document.body, 8);
    allElementsWithIDs = document.querySelectorAll('[id]');
    results = findElementsWithColoring(allElementsWithIDs);

    expect(results).toEqual(expected);
  });

  it('should color squares 3, 6, 11, 24 with a depth of 3', function () {
    expected = ['3', '6', '11', '24'];
    colorGeneration(document.body, 3);
    allElementsWithIDs = document.querySelectorAll('[id]');
    results = findElementsWithColoring(allElementsWithIDs);

    expect(results).toEqual(expected);
  });

  it('should color no squares with a depth of 0', function () {
    expected = [];
    colorGeneration(document.body, 0);
    allElementsWithIDs = document.querySelectorAll('[id]');
    results = findElementsWithColoring(allElementsWithIDs);

    expect(results).toEqual(expected);
  });
});