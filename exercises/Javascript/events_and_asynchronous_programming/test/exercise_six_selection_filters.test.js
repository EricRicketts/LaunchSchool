const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Exercise Six Selection Filters', function () {
  let results, expected, window, document,
    animalSelect, classificationSelect;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let html = fs.readFileSync(codeDirectory + '/exercise_six.html', 'utf8');
    let scriptContent = fs.readFileSync(codeDirectory + '/selection_filters.js', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    let scriptTag = document.createElement('script');
    let text = document.createTextNode(scriptContent);
    scriptTag.appendChild(text);
    document.head.appendChild(scriptTag);
    animalSelect = document.getElementById('animals');
    classificationSelect = document.getElementById('animal-classifications');
    expected = [
      ['Animals', 'Bear', 'Ostrich', 'Salmon', 'Turtle', 'Whale'],
      ['Bird', 'Classifications', 'Cold-blooded', 'Mammal', 'Vertebrate', 'Warm-blooded']
    ];
  });

  it('should start with default select items', function () {
    results = [[], []];
    Array.from(animalSelect.children).forEach(childElement => {
      results[0].push(childElement.value);
    });
    Array.from(classificationSelect.children).forEach(childElement => {
      results[1].push(childElement.value);
    });
    results.forEach(arr => arr.sort());
    expect(results).toEqual(expected);
  });

  it('option select from the classification menu changes the animal menu', function () {

  });
});