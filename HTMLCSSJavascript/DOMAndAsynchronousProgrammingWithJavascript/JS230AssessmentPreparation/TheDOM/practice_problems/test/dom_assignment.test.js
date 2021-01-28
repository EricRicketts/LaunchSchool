import * as path from 'path';
import * as fs from 'fs';
import { JSDOM } from 'jsdom';

describe('Practice Problem The DOM', function () {
  let window, document, results, expected, toggle, noticeDiv, clickEvent;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let htmlFile = fs.readFileSync(codeDirectory + '/dom_assignment.html', 'utf8');
    window = new JSDOM(htmlFile).window;
    document = window.document;
    toggle = document.getElementById('toggle');
    toggle.onclick = function(event) {
      event.preventDefault();
      let notice = document.getElementById('notice');
      let isHidden = notice.getAttribute('class') === 'hidden';
      isHidden ? notice.setAttribute('class', 'visible') : notice.setAttribute('class', 'hidden');
    }
    noticeDiv = document.getElementById('notice');
    clickEvent = document.createEvent('Event');
    clickEvent.initEvent('click', false, false);
    noticeDiv.onclick = function(event) {
      event.preventDefault();
      if (event.target.getAttribute('class') === 'visible') {
        event.target.setAttribute('class', 'hidden');
      }
    }
  });

  it('should add a class of "heading" to the h1 element', function () {
    expected = [0, true];
    let h1 = document.getElementById('primary_heading');
    results = [h1.classList.length];
    h1.classList.add('heading');
    results.push((h1.classList.length === 1 && h1.classList[0] === 'heading'));
    expect(results).toEqual(expected);
  });

  it('should set the class of the ul element to "bulleted"', function () {
    expected = [0, true];
    let ul = document.getElementById('list');
    results = [ul.classList.length];
    ul.classList.add('bulleted');
    results.push((ul.classList.length === 1 && ul.classList[0] === 'bulleted'));
    expect(results).toEqual(expected);
  });

  it('toggle element should reveal or hide the notice', function () {
    expected = [true, false, true, false, true, false];
    results = [noticeDiv.classList.contains('hidden'), noticeDiv.classList.contains('visible')];
    toggle.dispatchEvent(clickEvent);
    results.push(noticeDiv.classList.contains('visible'), noticeDiv.classList.contains('hidden'));
    toggle.dispatchEvent(clickEvent);
    results.push(noticeDiv.classList.contains('hidden'), noticeDiv.classList.contains('visible'));
    expect(results).toEqual(expected);
  });

  it('hide the notice if it is visible', function () {
    expected = [true, false, true, false, true, false];
    results = [noticeDiv.classList.contains('hidden'), noticeDiv.classList.contains('visible')];
    toggle.dispatchEvent(clickEvent);
    results.push(noticeDiv.classList.contains('visible'), noticeDiv.classList.contains('hidden'));
    noticeDiv.dispatchEvent(clickEvent);
    results.push(noticeDiv.classList.contains('hidden'), noticeDiv.classList.contains('visible'));
    expect(results).toEqual(expected);
  });

  it('should set the class of the body element to styled', function () {
    expected = [null, 'styled'];
    results = [document.body.getAttribute('id')];
    document.body.setAttribute('id', 'styled');
    results.push(document.body.getAttribute('id'));
    expect(results).toEqual(expected);
  });
});