import * as fs from 'fs';
import * as path from 'path';
import { JSDOM } from 'jsdom';

describe('Basic Data Attributes', function () {
  let window, document, results, expected, htmlFile; 
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code'); 
    htmlFile = fs.readFileSync(codeDirectory + '/index.html', 'utf8');
    let options = {
      runScripts: 'dangerously',
      resources: 'usable'
    };
    window = new JSDOM(htmlFile, options).window;
    document = window.document;
    let scriptFile = fs.readFileSync(codeDirectory + '/html_data_attributes.js', 'utf8');
    let code = document.createTextNode(scriptFile);
    let script = document.createElement('script');
    script.appendChild(code);
    document.head.appendChild(script);
  });

  it('should toggle articles based on anchor selection', function () {
    let silverAnchor = document.querySelector('a[data-block=silver]');
    let allArticles = document.querySelectorAll('article[data-block]');

    silverAnchor.click();
    Array.from(allArticles).forEach(article => {
      if (article.dataset.block === 'silver') {
        expect(article.style.display).toBe('block');
      } else {
        expect(article.style.display).toBe('none');
      }
    })
  });
});
