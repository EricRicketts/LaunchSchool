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
  let $list = $('ul');
  let productsHTML = products.map(product => {
    return productTemplate(product);
  });

  $(document.body).append($list.html(productsHTML.join('')));
});