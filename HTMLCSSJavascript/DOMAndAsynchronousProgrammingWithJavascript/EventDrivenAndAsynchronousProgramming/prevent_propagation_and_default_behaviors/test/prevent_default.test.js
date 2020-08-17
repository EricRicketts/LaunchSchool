const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Prevent Default', function () {
  let results, expected, codeDirectory, html, options, window, document, anchor, button;
  beforeEach(() => {
    codeDirectory = path.join(__dirname, '..', 'code');
    html = fs.readFileSync(codeDirectory + '/main.html', 'utf8');
    options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    window = new JSDOM(html, options).window;
    document = window.document;
    anchor = document.querySelector('a');
    button = document.querySelector('button');
  });

  describe('Normal Behavior Follow The Link', function () {
    beforeEach(() => {
      results = [];
      button.addEventListener('click', event => {
        results.push('A click event occurred on the button');
      });

      anchor.addEventListener('click', event => {
        results.push('A click event occurred on the anchor or bubbled up from the button');
      })
    });

    it('should follow the link when the button is clicked', function () {
      expected = ['A click event occurred on the button',
        'A click event occurred on the anchor or bubbled up from the button'];
      button.click();
      expect(results).toEqual(expected);
    });
  });

  describe('Prevent the link from being followed', function () {
    beforeEach(() => {
      results = [];
        button.addEventListener('click', event => {
          event.preventDefault();
          results.push('Following the link was prevented');
        });

        anchor.addEventListener('click', event => {
          results.push('Event on the anchor tag');
        }, true);
    });

    it('should not the link when clicking the button', function () {
      expected = ['Event on the anchor tag', 'Following the link was prevented'];
      button.click();
      expect(results).toEqual(expected);
      /*
        It is important to understand how things are working here.  The anchor element is set to be
        invoked on the capture path.  So, if the button is clicked, the anchor path listener gets invoked
        first, because the event occurred during the capture phase.  Then the event bubbles up from the
        button to the window and the event registered on the button is invoked, the text is pushed to the
        results array but the link for the anchor element is not followed of the event.preventDefault()
        statement.  Note this happens because the default behavior is not with regards to the element the
        listener is attached to but rather for the event object itself.  The browser waits for the event to
        propagate through both the capture and bubble phases before it performs the default action on the
        event.  Thus, since preventDefault was on the button, not link was followed.  However, if we do
        click on the anchor, the link does get followed.
      */
    });
  });

  describe('Override preventDefault', function () {
    beforeEach(() => {
      results = [];
      button.addEventListener('click', event => {
        event.preventDefault();
        results.push('Following the link was prevented')
      });

      anchor.addEventListener('click', event => {
        event.stopPropagation();
        results.push('A click event occurred on the anchor');
      }, true);
    });

    it('link is followed because preventDefault is never invoked', function () {
      expected = ['A click event occurred on the anchor'];
      button.click();
      expect(results).toEqual(expected);
    });
  });
});