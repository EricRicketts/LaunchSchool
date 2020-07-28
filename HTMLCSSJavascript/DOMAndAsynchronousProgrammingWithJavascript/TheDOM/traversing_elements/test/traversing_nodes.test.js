let fs = require('fs');
let path = require('path');
let jsdom = require('jsdom');
const { JSDOM } = jsdom;

describe('Traversing Nodes Assignment', function () {
  let firstDocument, secondDocument, results, expected;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let firstHTML = fs.readFileSync(codeDirectory + '/first.html', 'utf8');
    let secondHTML = fs.readFileSync(codeDirectory + '/second.html', 'utf8');
    let window = new JSDOM(firstHTML).window;
    firstDocument = window.document;
    window = new JSDOM(secondHTML).window;
    secondDocument = window.document;
  });

  it('find text node with benefit of a surrounding span', function () {
    let div = firstDocument.getElementsByTagName('div').item(0);
    Array.from(div.childNodes).forEach(node => {
      let condition = (node.nodeType === 3) && (/The time is/.test(node.nodeValue))
      if (condition) {
        let newText = node.nodeValue.replace(/\d{1,2}:\d{2} [ap]m/, '9:16 am');
        node.nodeValue = newText;
      }
    });
    let htmlString = div.innerHTML;
    expect(/9:16 am/.test(htmlString)).toBe(true);
  });

  it('finding text nodes must easier with a span', function () {
    secondDocument.querySelector('.time').textContent = '9:16 am';
    expect(/9:16 am/.test(secondDocument.getElementsByTagName('div').item(0).innerHTML)).toBe(true);
  });
});