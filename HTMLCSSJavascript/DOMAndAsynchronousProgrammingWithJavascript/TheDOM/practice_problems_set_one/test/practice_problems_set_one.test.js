let fs = require('fs');
let path = require('path');
let jsdom = require('jsdom');
const { JSDOM } = jsdom;

describe('Practice Problems Set One Traversing and Accessing Attributes', function () {
  let window, document, codeDirectory, htmlFile, results, expected;
  beforeEach(() => {
    codeDirectory = path.join(__dirname, '..', 'code');
  });
  describe('Working with the first document', function () {
    beforeEach(() => {
      htmlFile = fs.readFileSync(codeDirectory + '/practice_problems_set_one.html', 'utf8');
      window =  new JSDOM(htmlFile).window;
      document = window.document;
      document.querySelector('h1').style.fontSize = '32px';
      document.querySelector('h1').style.fontFamily = 'Times';
      document.querySelector('h1').style.fontWeight = '700';
      document.querySelector('h1').style.fontStyle = 'normal';
      document.querySelector('h1').style.color = 'black';
    });

    it('Verify defaults in beforeEach', function () {
      let h1 = document.querySelector('h1');
      expected = ['32px', 'Times', '700', 'normal', 'black'];
      results = [
        h1.style.fontSize, h1.style.fontFamily,
        h1.style.fontWeight, h1.style.fontStyle,
        h1.style.color
      ];
      expect(results).toEqual(expected);
    });

    it('change h1 font size and font color', function () {
      let h1 = Array.from(document.body.childNodes).find((node) => node.nodeName === 'H1');
      expected = ['48px', 'red'];
      h1.style.fontSize = '48px';
      h1.style.color = 'red';
      let h1ByQuery = document.querySelector('h1');
      let h1Styles = window.getComputedStyle(h1ByQuery, null);
      results = [
        h1Styles.getPropertyValue('font-size'), h1Styles.getPropertyValue('color')
      ];
      expect(results).toEqual(expected);
    });

    it('count the paragraphs on the page', function () {
      let paragraphNodes = Array.from(document.body.childNodes).filter((node) => node.nodeName === 'P');
      expect(paragraphNodes.length).toBe(5);
    });

    it('Get the first word from each paragraph', function () {
      expected = ['A', 'The', 'The', 'Where', 'And'];
      let paragraphNodes = Array.from(document.body.childNodes).filter((node) => node.nodeName === 'P');
      results = paragraphNodes.reduce((firstWords, paragraphNode) => {
        let firstWord = paragraphNode.textContent.match(/\w+/)[0];
        firstWords.push(firstWord);
        return firstWords;
      }, []);
      expect(results).toEqual(expected);
    });

    it('add the class called stanza to each paragraph except the first', function () {
      expected = ['', 'stanza', 'stanza', 'stanza', 'stanza'];
      let paragraphNodes = Array.from(document.body.childNodes).filter((node) => node.nodeName === 'P');
      paragraphNodes.slice(1).map(paragraphNode => paragraphNode.classList.add('stanza'));
      results = Array.from(document.getElementsByTagName('p')).reduce((classNames, pElement) => {
        classNames.push(pElement.className)
        return classNames;
      }, []);
      expect(results).toEqual(expected);
    });
  });
});

/*
For the last two exercises I had to use the provided HTML file which was large so I just worked on the code in the
console:
imgArr = [];
function walk(node, callback) {
    callback(node);
    for (let index = 0; index < node.childNodes.length; index += 1) {
        walk(node.childNodes[index], callback);
    }
}

function storeImg(node) {
    if (node.nodeName === 'IMG') {
        imgArr.push(node);
    }
}

walk(document.body, storeImg);
imgArr had 48 images which included img.thumbimage

*/

/*
Once I had the array of images I could look for png files:
let re = /.*png$/;

let pngArr = imgArr.filter(img => re.test(img.getAttribute('src)));

pngArr contained 23 png files
 */

/*
In the final problem I had to change the link color:

function changeLinkColor(node) {
    if (node.nodeName === 'A') {
        node.style.color = 'red';
    }
}

walk(document.body, changeLinkColor);
 */