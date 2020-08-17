const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Standard Attachment Of Listeners', function () {
  let window, document, results, expected, message;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    }
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/index1.html', 'utf8');
    let window = new JSDOM(html, options).window;
    document = window.document;
    message = document.getElementById('message');
    let script = document.createElement('script');
    script.textContent = fs.readFileSync(codeDirectory + '/standard_attachment_of_listeners.js', 'utf8');
    document.head.appendChild(script);
  });

  it('should have listeners attached to each button', function () {
    expected = ['', 'One was clicked!'];
    let button = document.getElementsByTagName('button').item(0);
    results = [message.textContent];
    button.click();
    results.push(message.textContent);
    expect(results).toEqual(expected);
  });
});