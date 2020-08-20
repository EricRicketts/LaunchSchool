document.addEventListener('DOMContentLoaded', () => {
  const bearAndWhale = ['Vertebrate', 'Warm-blooded', 'Mammal'];
  const salmonAndTurtle = ['Vertebrate', 'Cold-blooded'];

  const classifications = {
    'Classifications': ['Animals', 'Bear', 'Ostrich', 'Salmon', 'Turtle', 'Whale'],
    'Vertebrate': ['Bear', 'Ostrich', 'Salmon', 'Turtle', 'Whale'],
    'Warm-blooded': ['Bear', 'Ostrich', 'Whale'],
    'Cold-blooded': ['Salmon', 'Turtle'],
    'Mammal': ['Bear', 'Whale'],
    'Bird': ['Ostrich']
  }

  const animals = {
    'Animals': ['Classifications', 'Vertebrate', 'Warm-blooded',
      'Cold-blooded', 'Mammal', 'Bird'],
    'Bear': bearAndWhale,
    'Ostrich': ['Vertebrate', 'Warm-blooded', 'Bird'],
    'Salmon': salmonAndTurtle,
    'Turtle': salmonAndTurtle,
    'Whale': bearAndWhale
  }

  let classificationsSelect = document.getElementById('animal-classifications');
  let animalSelect = document.getElementById('animals');
  let clear = document.getElementById('clear');

  function addOptionsToSelect(selectElement, values) {
    values.forEach(value => {
      let option = document.createElement('OPTION');
      if (['Classifications', 'Animals'].includes(value)) {
        option.setAttribute('selected', 'true');
      }
      option.setAttribute('value', value);
      let text = document.createTextNode(value);
      option.appendChild(text);
      selectElement.appendChild(option);
    });
  }

  function changeSelect(event, selectElement, selectObject) {
    removeAllChildNodes(selectElement);
    addOptionsToSelect(selectElement, selectObject[event.target.value]);
  }

  function removeAllChildNodes(parent) {
    while (parent.firstChild) {
      parent.removeChild(parent.firstChild);
    }
  }

  function restoreDefaults(event) {
    [animalSelect, classificationsSelect].forEach(element => removeAllChildNodes(element));
    [
      [animalSelect, classifications['Classifications']],
      [classificationsSelect, animals['Animals']]
    ].forEach(([element, values]) => addOptionsToSelect(element, values));
  }

  classificationsSelect.addEventListener('change', event => {
    changeSelect(event, animalSelect, classifications);
  });
  animalSelect.addEventListener('change', event => {
    changeSelect(event, classificationsSelect, animals);
  });
  clear.addEventListener('click', restoreDefaults);
});