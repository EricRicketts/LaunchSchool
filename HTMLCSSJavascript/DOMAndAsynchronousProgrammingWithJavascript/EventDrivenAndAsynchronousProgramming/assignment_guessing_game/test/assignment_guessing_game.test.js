const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Assignment Guessing Game', function () {
  let window, document, inputField, inputSubmit, response, link, expected;
  beforeEach(() => {
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/main.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    let scriptTag = document.createElement('script');
    let scriptContent = document.createTextNode(fs.readFileSync(codeDirectory + '/main.js', 'utf8'));
    scriptTag.appendChild(scriptContent);
    document.head.appendChild(scriptTag);
    inputField = document.getElementById('guess');
    inputSubmit = document.querySelector('input[type="submit"]');
    response = document.querySelector('main > p');
    link = document.querySelector('a');
  });

  it('user entry should bring up a response message, user can start a new game', function () {
    inputField.value = '50';
    inputSubmit.click();
    expected = [
      'My number is lower than 50', 'My number is greater than 50',
      'You guessed it!!  It took 1 guesses'
    ];

    expect(expected.includes(response.firstChild.wholeText)).toBe(true);

    link.click();
    expected = 'Guess an integer number from 1 to 100';
    expect(response.firstChild.wholeText).toBe(expected);
  });

  it('should error check the user input', function () {
    expected = 'Incorrect entry, Guess an integer number from 1 to 100';
    ['0', '101', '5.4', 'abc'].forEach(entry => {
      inputField.value = entry;
      inputSubmit.click();
      expect(response.firstChild.wholeText).toBe(expected);
      link.click();
    });
  });

    it('should play a full game', function () {
      let regex = /^You guessed it!!/;
      let lowestValue = 0;
      let highestValue = 100;
      let guessValue;
      let newGuess;
      inputField.value = '50';
      inputSubmit.click();

      while (!regex.test(response.firstChild.wholeText)) {
        guessValue = Number.parseInt(inputField.value, 10);
        if (/lower/.test(response.firstChild.wholeText)) {
          newGuess = Math.floor((lowestValue + guessValue)/2);
          highestValue = guessValue;
        } else {
          newGuess = Math.floor((guessValue + highestValue)/2);
          lowestValue = guessValue;
        }
        inputField.value = String(newGuess);
        inputSubmit.click();
      }

      expect(inputSubmit.hasAttribute('disabled')).toBe(true);
    });
  });