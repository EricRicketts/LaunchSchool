function doubleObjectValues(object) {
  let newObject = {};
  Object.keys(object).forEach(function(key) {
    newObject[key] = object[key] * 2;
  });

  return newObject;
}

function getTotalFromInvoice(invoice) {
  let total = { total: 0 };
  Object.keys(invoice).forEach(function(key) {
    total.total += invoice[key];
  });

  return total;
}
function keepEvenValues(object) {
  let newObject = {};
  Object.keys(object).forEach(function(key) {
    if (object[key] % 2 === 0) {
      newObject[key] = object[key];
    }
  });

  return newObject;
}

export { doubleObjectValues, keepEvenValues, getTotalFromInvoice };