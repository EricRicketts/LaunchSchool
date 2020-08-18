const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Exercise Two Reverse Engineer', function () {
  let window, document, container, results, expected;
  beforeEach(() => {
    results = [];
    expected = ['', '', 'none'];
    let codeDirectory = path.join(__dirname, '..', 'code');
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let html = fs.readFileSync(codeDirectory + '/exercise_two.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    container = document.getElementById('container');
  });

  it('original code uses stop propagation', function () {
    document.querySelector('html').addEventListener('click', () => {
      document.querySelector('#container').style = 'display: none';
    });
    document.querySelector('#container').addEventListener('click', event => {
      event.stopPropagation();
    });

    results.push(container.style.display);
    container.click();
    results.push(container.style.display);
    container.parentNode.click();
    results.push(container.style.display);

    expect(results).toEqual(expected);
  });

  it('refactored code does not need stop propagation', function () {
    document.querySelector('html').addEventListener('click', event => {
      if (event.target.id !== 'container') {
        container.style = 'display: none';
      }
    });
    results.push(container.style.display);
    container.click();
    results.push(container.style.display);
    container.parentNode.click();
    results.push(container.style.display);

    expect(results).toEqual(expected);
  });

  it('Launch School solution is more robust, it checks for childNode clicks', function () {
    document.querySelector('html').addEventListener('click', event => {
      if (!container.contains(event.target)) {
        container.style = 'display: none';
      }
    });
    results.push(container.style.display);
    container.click();
    results.push(container.style.display);
    container.parentNode.click();
    results.push(container.style.display);

    expect(results).toEqual(expected);
  });
});