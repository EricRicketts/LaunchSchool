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

  let productTemplate = Handlebars.compile($('#productTemplate').html());
  let $list = $('<ul></ul>');
  $(document.body).append($list.html(productTemplate({ items: products })));
});