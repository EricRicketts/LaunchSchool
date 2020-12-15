import { Controller } from '../code/javascript/controller';
import { Game } from '../code/javascript/game';
import { View } from '../code/javascript/view';
import path from 'path';
import fs from 'fs';
import { JSDOM } from 'jsdom';

describe('Controller Functionality', function () {
  let window, document, game, view, controller, randomWordList, results, expected;
  let apples, message, replay, spaces, guesses;
  beforeEach(() => {
    let htmlPath = path.join(__dirname, '..');
    let htmlFile = fs.readFileSync(htmlPath + '/index.html', 'utf-8');
    window = new JSDOM(htmlFile).window;
    document = window.document;
    game = new Game();
    view = new View(document);
    controller = new Controller(game, view);
    randomWordList = [
      'stipend', 'foolish', 'signal', 'constant', 'bedazzle',
      'unction', 'abort', 'abrogate', 'upload', 'bequeath',
      'brilliant', 'genius', 'admonish', 'zenith', 'constraint'
    ].map(word => word.toUpperCase());
    apples = document.getElementById('apples');
    message = document.getElementById('message');
    replay = document.getElementById('replay');
    spaces = document.getElementById('spaces');
    guesses = document.getElementById('guesses');
    controller.init();
  });

  describe('Controller Initialization', function () {
    it('should initialize both the game and the view', function () {
      expected = [true, null, 0, null, true, true];
      let chosenWord = controller.game.word;
      let wordLength = chosenWord.length;
      results = [randomWordList.includes(chosenWord)];
      results.push(apples.getAttribute('class'), message.childNodes.length, replay.getAttribute('class'));
      results.push(Array.from(spaces.children).length === wordLength + 1);
      results.push(Array.from(guesses.children).length === 1);

      expect(results).toEqual(expected);
    });
  });

  describe('Controller Processes A Guess', function () {
    let randomWord, event, spacesSpans, guessesSpans;
    it('should handle a correct guess',  done => {
      randomWord = controller.game.word;
      let secondLetter = randomWord.toLowerCase()[1];
      event = new window.KeyboardEvent('keyup', {
        key: secondLetter,
        code: `Key${secondLetter.toUpperCase()}`,
        which: secondLetter.charCodeAt(0),
        shiftKey: false,
        ctrlKey: false,
        metaKey: false
      });
      document.dispatchEvent(event);

      spacesSpans = spaces.getElementsByTagName('span');
      guessesSpans = guesses.getElementsByTagName('span');
      results = [
        spacesSpans[1].textContent === secondLetter.toUpperCase(),
        guessesSpans[0].textContent === secondLetter.toUpperCase(),
        guessesSpans.length
      ];
      expected = [true, true, 1];
      expect(results).toEqual(expected);
      done();
    });

    it('should handle an incorrect guess', function () {
    });
  });
});
