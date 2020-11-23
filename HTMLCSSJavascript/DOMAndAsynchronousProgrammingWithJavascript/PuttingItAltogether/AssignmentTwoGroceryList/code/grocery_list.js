document.addEventListener('DOMContentLoaded', function() {
  let form = document.getElementById('add-item');
  let groceryList = document.querySelector('#grocery-list > ul');

  form.addEventListener('submit', event => {
    event.preventDefault();
    let formData = new FormData(form);
    let dataObject = {};
    Array.from(formData.entries()).forEach(([key, value]) => {
      let trimmedValue = value.trim();
      if (key === 'quantity' && trimmedValue === '') {
        trimmedValue = '1';
      }
      dataObject[key] = trimmedValue;
    });

      let li = document.createElement('li');
      let str = `${dataObject["quantity"]} ${dataObject["name"]}`;
      let text = document.createTextNode(str);
      li.appendChild(text);
      groceryList.appendChild(li);
    form.reset();
  });
});

/*
1.  have an array which stores the grocery items [ { name: quantity } ... ];
2.  have an event listener on the add button.
3.  if the quantity is an empty string, use a quantity of 1
4.  create a list item with quantity name
5.  append the list item to the ul
6.  clear the form.
*/