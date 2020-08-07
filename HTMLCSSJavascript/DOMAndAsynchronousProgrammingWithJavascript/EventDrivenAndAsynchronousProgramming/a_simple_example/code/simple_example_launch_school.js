document.addEventListener('DOMContentLoaded', () => {
  let count = 0;
  let output = document.getElementById('output');
  let addButton = document.getElementById('add');
  let resetButton = document.getElementById('reset');

  addButton.addEventListener('click', () => {
    count += 1;
    output.textContent = String(count);
  });

  resetButton.addEventListener('click', () => {
    count = 0;
    output.textContent = String(count);
  });
});

