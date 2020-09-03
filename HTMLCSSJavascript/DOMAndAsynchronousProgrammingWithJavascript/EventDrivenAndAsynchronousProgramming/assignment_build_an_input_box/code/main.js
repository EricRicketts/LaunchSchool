let textField;
let textContent;
let toggleCursor;

document.addEventListener('DOMContentLoaded', () => {
  textField = document.querySelector('div.text-field');

  textField.addEventListener('click', event => {
    event.stopPropagation();
    textField.classList.add('focused');
    toggleCursor = toggleCursor || setInterval(() => textField.classList.toggle('cursor'), 500);
  });
});


document.addEventListener('keydown', event => {
  textContent = document.querySelector('div.content');
  if (textField.classList.contains('focused')) {
    if (event.key === 'Backspace' || event.key === 'Delete') {
      let textLength = textContent.textContent.length;
      textContent.textContent = textContent.textContent.slice(0, textLength - 1);
    } else if (event.key.length === 1) {
      textContent.textContent = textContent.textContent + event.key;
    }
  }
});

document.addEventListener('click', event => {
  clearInterval(toggleCursor);
  textField.classList.remove('focused', 'cursor');
});
