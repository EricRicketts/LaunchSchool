document.addEventListener('DOMContentLoaded', () => {
  let results = document.getElementById('results');
  let elem1 = document.getElementById('elem1');
  elem1.addEventListener('click', event => {
    let target = event.target.id;
    let currentTarget = event.currentTarget.id;
    results.textContent = `click target was: ${target}, listener was ${currentTarget}`;
  });
});