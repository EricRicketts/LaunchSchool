const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Assignment Guessing Game', function () {
  let window, document, results, expected;
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
    let scriptContent = document.createTextNode(fs.readFileSync(__dirname + '/main.js', 'utf8'));
    scriptTag.appendChild(scriptContent);
    document.head.appendChild(scriptTag);
  });


});