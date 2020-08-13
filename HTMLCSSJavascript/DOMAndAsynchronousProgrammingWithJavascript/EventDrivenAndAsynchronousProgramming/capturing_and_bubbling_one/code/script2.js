document.addEventListener('DOMContentLoaded', () => {
  let elem1 = document.getElementById('elem1');
  let toggleBorders = {
    'elem1': false, 'elem2': false, 'elem3': false, 'elem4': false
  }
  elem1.addEventListener('click', event => {
    let id = event.target.id;
    let clickedElem = document.getElementById(id);
    toggleBorders[id] = !toggleBorders[id];
    clickedElem.classList.toggle('update-border', toggleBorders[id]);
  });
});