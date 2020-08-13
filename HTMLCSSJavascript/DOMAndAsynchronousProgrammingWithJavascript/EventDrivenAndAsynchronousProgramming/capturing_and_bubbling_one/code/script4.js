document.addEventListener('DOMContentLoaded', () => {
  let elem1 = document.getElementById('elem1');
  let elem4 = document.getElementById('elem4');

  elem1.addEventListener('click', event => {
    alert(event.currentTarget.id);
  });
  elem4.addEventListener('click', event => {
    alert(event.currentTarget.id);
  });
});