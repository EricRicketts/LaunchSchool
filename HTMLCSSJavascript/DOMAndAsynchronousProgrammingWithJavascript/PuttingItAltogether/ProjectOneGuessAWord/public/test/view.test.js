import { View } from '../code/javascript/view';
import path from 'path';
import fs from 'fs';
import { JSDOM } from 'jsdom';


describe('View Object functionality', function () {
  let window, document, game, view, results, expected, apples,  message, replay, spaces, guesses;
  beforeEach(() => {
    game = {};
    game.word = 'upside';
    game.letterSpacesForWord = game.word.length;
    game.validLetters = new Array(game.letterSpacesForWord);
    let htmlPath = path.join(__dirname, '..');
    let htmlFile = fs.readFileSync(htmlPath + '/index.html', 'utf-8');
    window =  new JSDOM(htmlFile).window;
    document = window.document;
    apples = document.getElementById('apples');
    message = document.getElementById('message');
    replay = document.getElementById('replay');
    spaces = document.getElementById('spaces');
    guesses = document.getElementById('guesses');
  });

  it('should initialize the view', function () {
    let text = document.createTextNode('A');
    let span = document.createElement('span');
    span.appendChild(text);
    [spaces, guesses].forEach(element => element.appendChild(span));
    View.init(document, game.letterSpacesForWord);
    expected = ['guess_1', 0, false, 6, 0, 1, 1, false];
    results = [
      apples.getAttribute('class'), message.childNodes.length, replay.hasAttribute('class'),
      spaces.getElementsByTagName('span').length, guesses.getElementsByTagName('span').length,
      spaces.getElementsByTagName('h2').length, guesses.getElementsByTagName('h2').length,
      document.body.hasAttribute('class')
    ];
    expect(results).toEqual(expected);
  });
});