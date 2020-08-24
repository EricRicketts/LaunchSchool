const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
const codeDirectory = path.join(__dirname, '..', 'code');
import { track, tracker } from "../code/events_tracker";

describe('Exercise Nine Events Tracker', function () {
  let window, document, results, expected, divRed, divBlue, divOrange, divGreen;
  beforeEach(() => {
    results = [];
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let html = fs.readFileSync(codeDirectory + '/exercise_nine.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;

    divRed = document.getElementById('red');
    divBlue = document.getElementById('blue');
    divOrange = document.getElementById('orange');
    divGreen = document.getElementById('green');

    divRed.addEventListener('click', track(event => {
      document.body.style.background = 'red';
    }));
    divBlue.addEventListener('click', track(event => {
      event.stopPropagation();
      document.body.style.background = 'blue';
    }));
    divOrange.addEventListener('click', track(event => {
      document.body.style.background = 'orange';
    }));
    divGreen.addEventListener('click', track(event => {
      document.body.style.background = 'green';
    }));
  });

  it('clicking elements adds to tracker object', function () {
    expected = [divBlue, divRed, divOrange, divGreen];
    let reducedExpected = [divBlue, divGreen];
    divBlue.click();
    divRed.click();
    divOrange.click();
    divGreen.click();

    results.push(tracker.elements()[0], tracker.elements()[3]);
    expect(tracker.list().length).toBe(4);
    expect(tracker.elements()).toEqual(expected);
    expect(results).toEqual(reducedExpected);

    tracker.clear();
    expect(tracker.list()).toEqual([]);
    tracker.list()[0] = 'abc';
    expect(tracker.list().length).toBe(0);
  });
});
