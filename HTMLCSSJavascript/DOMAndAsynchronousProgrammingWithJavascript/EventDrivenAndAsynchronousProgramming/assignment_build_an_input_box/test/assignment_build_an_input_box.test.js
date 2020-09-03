const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Assignment Build An Input Box', function () {
  let window, document, divTextField, divContent, expected, results;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/main.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    let scriptTag = document.createElement('script');
    let scriptContent = document.createTextNode(fs.readFileSync(codeDirectory + '/main.js', 'utf8'));
    scriptTag.appendChild(scriptContent);
    document.head.appendChild(scriptTag);
    divTextField = document.querySelector('div.text-field');
    divContent = document.querySelector('div.content');
  });

  it('click within text filed adds a focus, click outside removes focus', function () {
    expected = [false, true, false];
    results = [
      divTextField.classList.contains('focused')
    ];
    divTextField.click();
    results.push(divTextField.classList.contains('focused'));
    document.body.click();
    results.push(divTextField.classList.contains('focused'));

    expect(results).toEqual(expected);
  });
});