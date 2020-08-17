const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Delegation Issues', function () {
  let window, document, results, expected, button, message, anchor;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/index3.html', 'utf8');
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    window = new JSDOM(html, options).window;
    document = window.document;
    let scriptContent = fs.readFileSync(codeDirectory + '/delegation_issues.js', 'utf8');
    let script = document.createElement('script');
    script.textContent = scriptContent;
    document.head.appendChild(script);
    message = document.getElementById('message');
    anchor = document.getElementsByTagName('a').item(0);
    button = document.getElementsByTagName('button').item(2);
  });

  it('should behave differently if an anchor or button is clicked', function () {
    expected = ['', 'Five was clicked!', '', 'green'];
    results = [message.textContent];
    button.click();
    results.push(message.textContent);
    results.push(window.getComputedStyle(anchor).color);
    anchor.click();
    results.push(window.getComputedStyle(anchor).color);
    expect(results).toEqual(expected);
  });
});