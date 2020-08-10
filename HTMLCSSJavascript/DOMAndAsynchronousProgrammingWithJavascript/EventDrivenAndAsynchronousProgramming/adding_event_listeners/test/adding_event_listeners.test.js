const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Adding Event Listeners', function () {
  let document, results, expected, text;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let scriptContent = fs.readFileSync(codeDirectory + '/event_listener.js', 'utf8');
    let html = fs.readFileSync(codeDirectory + '/index.html', 'utf8');
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let window = new JSDOM(html, options).window;
    document = window.document;
    let scriptTag = document.createElement('script');
    scriptTag.textContent = scriptContent;
    document.head.appendChild(scriptTag);
    text = 'This is text in the textarea element.';
    let textAreaElement = document.getElementById('message');
    textAreaElement.value =  text;
  });

  it('should make a new paragraph when the alert button is clicked', function () {
    expected = [null, text];
    results = [document.querySelector('p')];
    document.getElementById('alert').click();
    let paragraphElement = document.querySelector('p');
    results.push(paragraphElement.textContent);

    expect(results).toEqual(expected);
  });

  it('If a paragraph already exists it is deleted and then recreated', function () {
    let newText = 'This is new text.';
    expected = [text, 1, newText];
    document.getElementById('alert').click();
    let paragraphElement = document.querySelector('p');
    results = [paragraphElement.textContent];
    let textAreaElement = document.getElementById('message');
    textAreaElement.value = newText;
    document.getElementById('alert').click();
    let allParagraphs = document.querySelectorAll('p');
    results.push(allParagraphs.length);
    results.push(allParagraphs.item(0).textContent);

    expect(results).toEqual(expected);
  });

  it('the reset button should clear out the paragraph', function () {
    expected = [1, 0];
    document.getElementById('alert').click();
    results = [document.querySelectorAll('p').length];
    document.getElementById('reset').click();
    results.push(document.querySelectorAll('p').length);

    expect(results).toEqual(expected);
  });
});