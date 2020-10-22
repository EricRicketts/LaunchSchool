$(document).ready(function() {
  let products = [
    {
      name: 'Banana',
      quantity: 14,
      price: 0.79
    },
    {
      name: 'Apple',
      quantity: 3,
      price: 0.55
    }
  ];

  let productsList = Handlebars.compile($('#productsList').html());
  let productTemplate = Handlebars.compile($('#productTemplate').html());
  let $list = $('<ul></ul>');

  Handlebars.registerPartial('productTemplate', $('#productTemplate').html());

  $list.html(productsList({ items: products }));

  let newProduct = {
    name: 'Soup',
    quantity: 1,
    price: 1.29
  };

  $list.append(productTemplate(newProduct));

  $(document.body).append($list);
});