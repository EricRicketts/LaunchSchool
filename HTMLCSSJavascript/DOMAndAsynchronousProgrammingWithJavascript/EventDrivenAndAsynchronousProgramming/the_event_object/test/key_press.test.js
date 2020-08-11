const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Key Press Exercise', function () {
  let window, document, expected, results;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let html = fs.readFileSync(codeDirectory + '/key_press.html', 'utf8');
    let scriptContent = fs.readFileSync(codeDirectory + '/key_press.js', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    let scriptTag = document.createElement('script');
    scriptTag.textContent = scriptContent;
    document.head.appendChild(scriptTag);
  });

  it('should show a shift key', function () {
    results = [];
    expected = [
      'keydown', 'Shift', 'true', 'false', 'false', 'false',
      'keyup', 'Shift', 'true', 'false', 'false', 'false'
    ];
    let eventInitDict = {
      'key': 'Shift', 'code': 'ShiftLeft', 'shiftKey': true, "location": 1
    };
    let keydown = new window.KeyboardEvent('keydown', eventInitDict)
    document.dispatchEvent(keydown);
    let keyup = new window.KeyboardEvent('keyup', eventInitDict);
    document.dispatchEvent(keyup);

    let allRows = document.querySelectorAll('tbody > tr');
    Array.from(allRows).forEach(row => {
      Array.from(row.children).forEach(tr => {
        results.push(tr.textContent);
      });
    });

    expect(results).toEqual(expected);
  });
});