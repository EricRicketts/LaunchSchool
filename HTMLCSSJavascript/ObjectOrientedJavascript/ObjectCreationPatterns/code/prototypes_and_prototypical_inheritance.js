function extend(destination, ...objects) {
  let numberOfObjects = objects.length;
  for (let i = 0; i < numberOfObjects; i += 1) {
    let currentObject = objects[i];
    let properties = Object.getOwnPropertyNames(currentObject);
    let numberOfProperties = properties.length;

    for (let j = 0; j < numberOfProperties; j += 1) {
      let property = properties[j];
      if (!destination[property]) {
        if (typeof currentObject[property] === 'object') {
          destination[property] = JSON.parse(JSON.stringify(currentObject[property]));
        } else {
          destination[property] = currentObject[property];
        }
      }
    }
  }
  return destination;
}

function getDefiningObject(object, propKey) {
  if (object.hasOwnProperty('hasOwnProperty')) {
    return Object.getPrototypeOf(Object.prototype);
  } else if (object.hasOwnProperty(propKey)) {
    return object;
  }  else {
    return getDefiningObject(Object.getPrototypeOf(object), propKey);
  }
}

function shallowCopy(object) {
  let copy = Object.create(Object.getPrototypeOf(object));

  Object.getOwnPropertyNames(object).forEach((prop) => {
    copy[prop] = object[prop];
  });

  return copy;
}

export { extend, getDefiningObject, shallowCopy };

/*
Launch School had a nice conventional solution for getDefiningObject:

function getDefiningObject(object, propKey) {
  while (object && !object.hasOwnProperty(propKey)) {
    object = Object.getPrototypeOf(object);
  }

  return object;
}

one continually works up the prototype chain by setting object to its prototype, so if the current object does
have the propKey as its own property !object.hasOwnProperty(propKey) will be false and the loop will exit and the
proper object will be returned.

When we get to the beginning of the prototype chain, we terminate because eventually Object.getPrototype will return
null.  When this happens the loop exits as null is a falsy value and since object is set to null, the return value
in that case will be null.

Launch School had some important concepts with regards to the shallowCopy problem.  My code was originally incorrect,
as I had:

let copy = Object.create(object), this puts the "own" properties of object into the [[Prototype]] of the copy object,
but then I copied the "own" properties, which was redundant.  I did not think of the problem requirements with enough
depth.  So if one is doing a shallow copy, what does this mean?  it means to copy the current objects "own" properties
and then to copy the prototype of the current object so both the new object and current object point to the same
prototype.

*/