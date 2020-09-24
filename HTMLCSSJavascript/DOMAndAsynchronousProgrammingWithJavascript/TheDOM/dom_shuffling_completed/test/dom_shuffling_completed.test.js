let fs = require('fs');
let path = require('path');
let { JSDOM } = require('jsdom');

describe('Assignment DOM Shuffling Completed', function () {
  let originalDocument, mixedUpDocument, scriptElement;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let codeDirectory = path.join(__dirname + '..');
    let origHTML = fs.readFileSync(codeDirectory + '/original.html', 'utf8');
    let mixedUpHTML = fs.readFileSync(codeDirectory + '/mixup.html', 'utf8');
    originalDocument = new JSDOM(origHTML, options).window.document;
    mixedUpDocument = new JSDOM(mixedUpHTML, options).window.document;
    scriptElement = mixedUpDocument.createElement('script');
    let scriptFile = fs.readFileSync(codeDirectory + '/my_fixer.js', 'utf8');
    let scriptContent = mixedUpDocument.createTextNode(scriptFile);
    scriptElement.appendChild(scriptContent);
  });

  it('should move elements in the mixed up html so as to match the original html', function () {
    
  });
});