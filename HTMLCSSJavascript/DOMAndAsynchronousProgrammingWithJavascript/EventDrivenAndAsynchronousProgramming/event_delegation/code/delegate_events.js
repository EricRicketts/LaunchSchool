document.addEventListener('click', event => {
  if (event.target.tagName === 'BUTTON') {
    let message = document.getElementById('message');
    message.text = `${event.targt.textContent} was clicked!`;
  }
});