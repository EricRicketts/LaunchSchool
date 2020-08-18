const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
const makeBold = require('../code/make_bold_and_custom');

describe('Exercise Three Make Bold and Custom', function () {
  let results, expected, window, document, heading, section, paragraph;
  beforeEach(() => {
    results = [];
    let codeDirectory = path.join(__dirname, '..', 'code');
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let html = fs.readFileSync(codeDirectory + '/exercise_three.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    heading = document.querySelector('h1');
    section = document.querySelector('section');
    paragraph = document.querySelector('p');
  });

  it('default behavior makes text bold', function () {
    expected = ['', 'bold'];
    results.push(window.getComputedStyle(paragraph, null).fontWeight);
    makeBold(paragraph);
    results.push(window.getComputedStyle(paragraph, null).fontWeight);

    expect(results).toEqual(expected);
  });

  it('non default behavior pass in the desired class', function () {
    expected = ['', 'red'];
    results.push(window.getComputedStyle(heading, null).color);
    let redText = (element, cssClass) => {
      element.classList.add(cssClass);
    }
    makeBold(heading, 'red-text', redText);
    results.push(window.getComputedStyle(heading, null).color);

    expect(results).toEqual(expected);
  });

});