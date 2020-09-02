document.addEventListener('DOMContentLoaded', () => {
  let answer;
  let introMessage = 'Guess an integer number from 1 to 100';
  let errorMessage = `Incorrect entry, ${introMessage}`;
  let guess = 0;
  let guesses;
  let form = document.querySelector('form');
  let message = '';
  let paragraph = document.querySelector('p');
  let submitInput = document.querySelector('input[type="submit"]');

  function determineNextGuessDirection(guess, answer, guesses) {
    if (guess > answer) {
     return `My number is lower than ${String(guess)}`;
    } else if (guess < answer) {
      return `My number is greater than ${String(guess)}`;
    } else {
      disableSubmitGuess()
      return `You guessed it!!  It took ${String(guesses)} guesses`;
    }
  }

  function disableSubmitGuess() {
    submitInput.setAttribute('disabled', 'true');
    submitInput.style.background = 'lightgrey';
    submitInput.style.textShadow = 'none';
    submitInput.style.border = 'none';
  }

  function enableSubmitGuess() {
    submitInput.removeAttribute('disabled');
    submitInput.style = null;
  }

  function isValidGuess(inputString) {
    let regexValidNumberEntry = /^([1-9]|[1-9][0-9]|100)$/;
    return regexValidNumberEntry.test(inputString);
  }

  function newGame() {
    guesses = 0;
    answer = Math.floor(Math.random() * 100) + 1;
    message = document.createTextNode(introMessage);
    paragraph.replaceChild(message, paragraph.firstChild);
    form.elements[1].value = '';
  }

  function updateMessage(message) {
    let messageTextNode = document.createTextNode(message);
    paragraph.replaceChild(messageTextNode, paragraph.firstChild);
  }

  form.addEventListener('submit', event => {
    event.preventDefault();

    if (isValidGuess(form.elements[1].value)) {
      guess = Number.parseInt(form.elements[1].value, 10);
      guesses += 1;
      updateMessage(determineNextGuessDirection(guess, answer, guesses));
    } else {
      updateMessage(errorMessage);
    }
  });

  document.querySelector('a').addEventListener('click', event => {
    event.preventDefault();
    enableSubmitGuess();
    newGame();
  });

  newGame();
});