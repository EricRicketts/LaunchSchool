function incrementProperty(obj, property) {
  var incrementedValue;

  if (Object.keys(obj).includes(property)) {
    if (typeof(obj[property]) === 'number') {
      incrementedValue = obj[property] + 1;
      obj[property] = incrementedValue;
    } else {
      incrementedValue = obj[property];
    }    
  } else {
    incrementedValue = 1;
    obj[property] = incrementedValue;
  }

  return incrementedValue;
}

function objectHasProperty(obj, property) {
  return Object.keys(obj).includes(property);
}

export { incrementProperty, objectHasProperty };