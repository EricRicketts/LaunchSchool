function setUpListeners(document) {
  let count = 0;
  let output = document.getElementById('output');
  let addButton = document.getElementById('add');
  let resetButton = document.getElementById('reset');

  addButton.addEventListener('click', event => {
    count += 1;
    output.textContent = String(count);
  });

  resetButton.addEventListener('click', event => {
    count = 0;
    output.textContent = String(count);
  })
}

function elementsWithListeners(document) {
  let output = document.getElementById('output');
  let addButton = document.getElementById('add');
  let resetButton = document.getElementById('reset');

  return [output, addButton, resetButton];
}

export { setUpListeners, elementsWithListeners };