/*
the problem with both of the 'wrong' functions is that 0 is a falsy value
in Javascript.  Obviously, if there is zero quantity the price should also be zero.
 */

function processOrder(price, quantity, discount, serviceCharge, tax) {
  if (typeof(quantity) !== 'number') {
    quantity = 1;
  }

  if (typeof(serviceCharge) !== 'number') {
    serviceCharge = 0.1;
  }

  if (typeof(tax) !== 'number') {
    tax = 0.15;
  }

  discount = discount || 0;

  return (price*quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

function wrongProcessOrderOne(price, quantity, discount, serviceCharge, tax) {
  if (!quantity) {
    quantity = 1;
  }

  if (!discount) {
    discount = 0;
  }

  if (!serviceCharge) {
    serviceCharge = 0.1;
  }

  if (!tax) {
    tax = 0.15;
  }

  return (price*quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

function wrongProcessOrderTwo(price, quantity, discount, serviceCharge, tax) {
  quantity = quantity || 1;
  discount = discount || 0;
  serviceCharge = serviceCharge || 0.1;
  tax = tax || 0.15;

  return (price*quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

export { processOrder, wrongProcessOrderOne, wrongProcessOrderTwo };