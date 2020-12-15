import { View } from '../code/javascript/view';
import path from 'path';
import fs from 'fs';
import { JSDOM } from 'jsdom';


describe('View Object functionality', function () {
  let window, document, view, game, results, expected, apples,  message, replay, spaces, guesses;
  beforeEach(() => {
    game = {};
    game.word = 'foobar';
    game.letterSpacesForWord = game.word.length;
    game.validLetters = new Array(game.letterSpacesForWord);
    game.guessedLetters = [];
    game.incorrectGuesses = 0;
    let htmlPath = path.join(__dirname, '..');
    let htmlFile = fs.readFileSync(htmlPath + '/index.html', 'utf-8');
    window =  new JSDOM(htmlFile).window;
    document = window.document;
    apples = document.getElementById('apples');
    message = document.getElementById('message');
    replay = document.getElementById('replay');
    spaces = document.getElementById('spaces');
    guesses = document.getElementById('guesses');
    view = new View(document);
    view.init(game.letterSpacesForWord);
  });

  it('should initialize the view', function () {
    let text = document.createTextNode('A');
    let span = document.createElement('span');
    span.appendChild(text);
    [spaces, guesses].forEach(element => element.appendChild(span));
    view.init(game.letterSpacesForWord);
    expected = [null, 0, false, 6, 0, 1, 1, false];
    results = [
      apples.getAttribute('class'), message.childNodes.length, replay.hasAttribute('class'),
      spaces.getElementsByTagName('span').length, guesses.getElementsByTagName('span').length,
      spaces.getElementsByTagName('h2').length, guesses.getElementsByTagName('h2').length,
      document.body.hasAttribute('class')
    ];
    expect(results).toEqual(expected);
  });

  it('should update the word letters', function () {
    [game.validLetters[1], game.validLetters[2]] = ['O', 'O'];
    view.updateSpaces(game.validLetters)
    results = [];
    expected = ['', 'O', 'O', '', '', ''];
    Array.from(spaces.children).forEach(element => {
      if (element.nodeName !== 'H2') { results.push(element.textContent); }
    });
    expect(results).toEqual(expected);
  });

  it('should update the guesses', function () {
    results = [];
    game.guessedLetters.push('F');
    expected = ['F'];
    view.updateGuesses('F');
    Array.from(guesses.children).forEach(element => {
      if (element.nodeName !== 'H2') { results.push(element.textContent); }
    });
    expect(results).toEqual(expected);
  });

  it('should update the remaining guesses', function () {
    game.incorrectGuesses = 3;
    view.updateRemainingGuesses(game.incorrectGuesses);
    expect(apples.getAttribute('class')).toBe('guess_3');
  });

  it('should display the game win', function () {
    results = [];
    expected = ['win', 'You win!!', 'visible'];
    view.displayWin();
    results.push(document.body.getAttribute('class'), message.textContent, replay.getAttribute('class'));
    expect(results).toEqual(expected);
  });

  it('should display the game loss', function () {
    results = [];
    expected = ['lose', 'Sorry, you lost.', 'visible'];
    view.displayLoss();
    results.push(document.body.getAttribute('class'), message.textContent, replay.getAttribute('class'));
    expect(results).toEqual(expected);
  });

  it('should present the out of words state', function () {
    results = [];
    expected = ['lose', 'The Game is out of words.', false];
    view.outOfWords();
    results.push(document.body.getAttribute('class'), message.textContent, replay.hasAttribute('class'));
    expect(results).toEqual(expected);
  });
});