document.addEventListener('click', event => {
  let tag = event.target.tagName;

  if (tag === 'BUTTON') {
    let message = document.getElementById('message');
    message.textContent = `${event.target.textContent} was clicked!`;
  } else if (tag === 'A') {
    event.preventDefault();
    event.target.classList.toggle('highlight');
  }
});