document.addEventListener('click', event => {
  if (event.target.tagName === 'BUTTON') {
    let message = document.getElementById('message');
    message.textContent = `${event.target.textContent} was clicked!`;
  }
});