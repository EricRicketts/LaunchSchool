function incrementProperty(obj, property) {

  if (obj[property]) {
    if (typeof(obj[property]) === 'number') { obj[property] += 1; }
  } else {
    obj[property] = 1;
  }

  return obj[property];
}

function objectHasProperty(obj, property) {
  return Object.keys(obj).includes(property);
}

export { incrementProperty, objectHasProperty };