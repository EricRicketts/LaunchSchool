document.addEventListener('DOMContentLoaded', () => {
  let composer = document.querySelector('.composer');
  let textarea = composer.querySelector('textarea');
  let counter = composer.querySelector('.counter');
  let button = composer.querySelector('button')
  let charLimit = 140;
  counter.textContent = `140 characters remaining`;

  function updateCounter(event) {
    if (event) {
      let textAreaLength = textarea.value.length;
      let remaining = charLimit - textAreaLength;
      let invalid = remaining < 0;
      textarea.classList.toggle('invalid', invalid);
      button.disabled = invalid;
      counter.textContent = `${remaining} characters remaining`;
    }
  }

  textarea.addEventListener('keypress', updateCounter);
});