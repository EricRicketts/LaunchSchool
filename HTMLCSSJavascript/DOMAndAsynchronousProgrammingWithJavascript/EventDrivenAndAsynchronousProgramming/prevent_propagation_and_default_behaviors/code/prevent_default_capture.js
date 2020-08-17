document.addEventListener('DOMContentLoaded', () => {
  document.querySelector('button').addEventListener('click', event => {
    event.preventDefault();
    alert('Following the link was prevented');
  });

  document.querySelector('a').addEventListener('click', evt => {
    alert('Click event on the anchor tag');
  }, true);
});