document.addEventListener('DOMContentLoaded', () => {
  function clickHandler(event) {
    let message = document.getElementById('message');
    message.textContent = `${event.target.textContent} was clicked!`;
  }

  let buttons = document.getElementsByTagName('button');
  let numberOfButtons = buttons.length;

  for (let index = 0; index < numberOfButtons; index += 1) {
    buttons[index].addEventListener('click', clickHandler);
  }
});