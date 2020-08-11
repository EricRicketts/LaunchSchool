document.addEventListener('DOMContentLoaded', () => {
  document.body.addEventListener('click', event => {
    let elementClicked = event.target;
    let elementAttached = event.currentTarget;
    let p = document.getElementById('message');
    p.textContent = elementClicked.tagName;
    let p2 = document.getElementById('message2');
    p2.textContent = elementAttached.tagName;
  });
});