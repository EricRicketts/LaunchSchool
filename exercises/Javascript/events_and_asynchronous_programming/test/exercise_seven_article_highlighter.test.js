const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Exercise Seven Article Highlighter', function () {
  let results, expected, window, document, main, header, highlight, highlightClass;
  beforeEach(() => {
    highlight = 'highlight';
    highlightClass = '.'.concat(highlight);
    let codeDirectory = path.join(__dirname, '..', 'code');
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let html = fs.readFileSync(codeDirectory + '/exercise_seven.html', 'utf8');
    let scriptContent = fs.readFileSync(codeDirectory + '/article_highlighter.js', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    let scriptTag = document.createElement('script');
    let text = document.createTextNode(scriptContent)
    scriptTag.appendChild(text);
    document.head.appendChild(scriptTag);
    main = document.querySelector('main');
    header = document.querySelector('header');
    results = [];
  });

  it('click a link put a highlight around referenced article remove other highlights', function () {
    let anchorOne = document.querySelector('a[href="#article-1"]');
    let articleOne = document.getElementById('article-1');
    let anchorFour = document.querySelector('a[href="#article-4"]');
    let articleFour = document.getElementById('article-4');

    expected = [null, 1, true, 1, true];
    results.push(document.querySelector(highlightClass));
    anchorOne.click();
    results.push(document.querySelectorAll(highlightClass).length);
    results.push(articleOne.classList.contains(highlight));

    anchorFour.click();
    results.push(document.querySelectorAll(highlightClass).length);
    results.push(articleFour.classList.contains(highlight));

    expect(results).toEqual(expected);
  });

  it('click article or child of article highlights article', function () {
    expected = [1, true, 1, true];
    let articleThree = document.querySelector('#article-3');
    let articleFour = document.querySelector('#article-4');

    articleThree.click();
    results.push(document.querySelectorAll(highlightClass).length);
    results.push(articleThree.classList.contains(highlight));

    let paragraphArticleFour = articleFour.querySelector('p');
    paragraphArticleFour.click();
    results.push(document.querySelectorAll(highlightClass).length);
    results.push(articleFour.classList.contains(highlight));

    expect(results).toEqual(expected);
  });

  it('click outside of any article or anchor highlights the main element', function () {
    expected = [1, true];
    let main = document.querySelector('main');
    document.body.click();

    results.push(document.querySelectorAll(highlightClass).length);
    results.push(main.classList.contains(highlight));

    expect(results).toEqual(expected);
  });
});
