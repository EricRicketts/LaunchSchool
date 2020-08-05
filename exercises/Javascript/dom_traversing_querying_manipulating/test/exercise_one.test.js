const fs = require('fs');
const path = require('path');

describe('Exercise One', function () {
  let firstDiv, secondDiv, expected, results;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let htmlFile = fs.readFileSync(codeDirectory + '/exercise_one.html', 'utf8');
    document.body.innerHTML = htmlFile;
    let divs = document.getElementsByTagName('div');
    firstDiv = divs.item(0);
    secondDiv = divs.item(1);
  });

  it('distinguish extra white space as additional child nodes', function () {
    expected = [3, 1, 2, 0];
    results = [firstDiv.childNodes.length, secondDiv.childNodes.length];

    let firstDivTextNodes = Array.from(firstDiv.childNodes).filter(node => node.nodeType === 3);
    let secondDivTextNodes = Array.from(secondDiv.childNodes).filter(node => node.nodeType === 3);

    results.push(firstDivTextNodes.length, secondDivTextNodes.length);
    expect(results).toEqual(expected);
  });
});