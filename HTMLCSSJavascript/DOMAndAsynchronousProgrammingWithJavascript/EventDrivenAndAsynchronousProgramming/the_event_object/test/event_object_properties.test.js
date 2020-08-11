const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Event Object Properties', () => {
  let document, window, expected, paragraphSpanOne, paragraphSpanTwo, results;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/event_object_properties.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    let scriptTag = document.createElement('script');
    scriptTag.textContent = fs.readFileSync(codeDirectory + '/event_object_properties.js', 'utf8');
    document.head.appendChild(scriptTag);
    paragraphSpanOne = document.getElementById('message');
    paragraphSpanTwo = document.getElementById('message2');
  });
  
  it('should be listening on the entire page, click first paragraph', function () {
    expected = ['none', 'none', 'P', 'BODY'];
    results = [paragraphSpanOne.textContent, paragraphSpanTwo.textContent];
    let firstParagraph = document.querySelector('p');
    firstParagraph.click();
    results.push(paragraphSpanOne.textContent, paragraphSpanTwo.textContent);
    expect(results).toEqual(expected);
  });

  it('event target in this case can be any element within the html', function () {
    expected = [
      'SPAN', 'green', 'LI', 'purple',
      'UL', 'red', 'DIV', 'blue'
    ];
    let firstListItemSpan = document.querySelector('div.example > ul > li:first-child > span');
    let secondListItem = document.querySelector('div.example > ul > li:nth-child(2)');
    let unorderedList = document.querySelector('div.example > ul');
    let div = document.querySelector('div.example');

    firstListItemSpan.click();
    results = [paragraphSpanOne.textContent, window.getComputedStyle(firstListItemSpan, null).borderColor];
    secondListItem.click();
    results.push(paragraphSpanOne.textContent, window.getComputedStyle(secondListItem).borderColor);
    unorderedList.click();
    results.push(paragraphSpanOne.textContent, window.getComputedStyle(unorderedList).borderColor);
    div.click();
    results.push(paragraphSpanOne.textContent, window.getComputedStyle(div).borderColor);

    expect(results).toEqual(expected);
  });
});