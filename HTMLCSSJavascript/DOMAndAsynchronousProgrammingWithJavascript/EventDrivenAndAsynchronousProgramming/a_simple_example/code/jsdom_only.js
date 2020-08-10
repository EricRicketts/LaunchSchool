const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
let codeDirectory = path.join(__dirname, '..', 'code');
html = fs.readFileSync(codeDirectory + '/main.html', 'utf8');
let options = {
  resources: 'usable',
  runScripts: 'dangerously',
};
const dom = new JSDOM(html, options);
dom.window.document.addEventListener('DOMContentLoaded', () => {
  // We need to delay one extra turn because we are the first DOMContentLoaded listener,
  // but we want to execute this code only after the second DOMContentLoaded listener
  // (added by external.js) fires.
  setImmediate(() => {
    console.log(dom.window.document.body.children.length)
    console.log(dom.window.document.body.innerHTML)
    console.log(output.textContent);
    addButton.click();
    console.log(output.textContent);
  });
});
let window = dom.window;
let document = window.document;

let addButton = document.getElementById('add');
let output = document.getElementById('output');

console.log(output.textContent);
addButton.click();
console.log(output.textContent);
