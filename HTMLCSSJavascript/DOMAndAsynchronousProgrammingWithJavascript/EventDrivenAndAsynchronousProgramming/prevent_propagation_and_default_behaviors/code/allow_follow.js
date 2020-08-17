document.addEventListener('DOMContentLoaded', () => {
  document.querySelector('button').addEventListener('click', evt => {
    evt.preventDefault();
    alert('Following the link was prevented');
  });

  document.querySelector('a').addEventListener('click', evt => {
    evt.stopPropagation()
    alert('Click event on the anchor tag');
  }, true);
});