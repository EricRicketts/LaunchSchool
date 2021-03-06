let _ = function(element) {

  function findMatchingKeys(object, currentElement, objectKeys) {
    let numberOfKeys = objectKeys.length;
    let matchingKeys = [];
    for (let j = 0; j < numberOfKeys; j += 1) {
      let currentKey = objectKeys[j];
      if (object[currentKey] === currentElement[currentKey]) matchingKeys.push(currentKey);
    }

    return matchingKeys;
  }

  function findObjectKeys(object) {
    let keys = [];
    for (const key in object) {
      if (object.hasOwnProperty(key)) keys.push(key);
    }

    return keys;
  }

  function makeSample(size) {
    let sampledArray = [];
    let copiedArray = element.slice();
    let randomIndex, randomElement;

    while (sampledArray.length < size) {
      randomIndex = Math.floor(Math.random() * copiedArray.length - 1);
      randomElement = copiedArray[randomIndex];
      if (!sampledArray.includes(randomElement)) sampledArray.push(randomElement);
    }

    return sampledArray;
  }

  let u = {
    findWhere: function(object) {
      let elementSize = element.length;
      let foundObject = undefined;

      for (let i = 0; i < elementSize; i += 1) {
        let currentElement = element[i];
        let objectKeys = findObjectKeys(object);

        let matchingKeys = findMatchingKeys(object, currentElement, objectKeys);
        if (matchingKeys.length === objectKeys.length) {
          foundObject = currentElement;
          break;
        }
      }

      return foundObject;
    },

    first: function() {
      return element[0];
    },

    has: function(key) {
      let objOwnKeys = Object.keys(element);
      let numberObjOwnKeys = objOwnKeys.length;
      for (let i = 0; i < numberObjOwnKeys; i += 1) {
        if (objOwnKeys[i] === key) return true;
      }

      return false;
    },

    isArray: function() {
      return Object.prototype.toString.call(element) === '[object Array]';
    },

    isBoolean: function() {
      return typeof element === 'boolean' || typeof element === 'object' || typeof element === 'function';
    },

    isFunction: function() {
      return Object.prototype.toString.call(element) === '[object Function]';
    },

    isNumber: function() {
      return typeof element === 'number' || typeof element === 'object';
    },

    isObject: function() {
      return typeof element === 'object' || typeof element === 'function';
    },

    isString: function() {
      return typeof element === 'string' || typeof element === 'object';
    },

    keys: function() {
      let ownKeys = [];
      for (const key in element) {
        if (element.hasOwnProperty(key)) ownKeys.push(key);
      }

      return ownKeys;
    },

    last: function() {
      let lastIndex = element.length - 1;
      return element[lastIndex];
    },

    lastIndexOf: function(elem) {
      let lastIndex = undefined;
      element.forEach((val, index) => {
        if (val === elem) { lastIndex = index }
      })

      return lastIndex;
    },

    omit: function(...keys) {
      let newObj = {};
      Object.keys(element).forEach((origKey) => {
        if (element.hasOwnProperty(origKey)) {
          if (!keys.includes(origKey)) {
            newObj[origKey] = element[origKey];
          }
        }
      });

      return newObj;
    },

    pick: function(...keys) {
      let newObj = {}
      keys.forEach((key) => {
        if (element.hasOwnProperty(key)) {
          newObj[key] = element[key];
        }
      });

      return newObj;
    },

    pluck: function(key) {
      return element.filter((object) => {
        return object.hasOwnProperty(key);
      }).flatMap((object) => {
        return Object.values(object)
      });
    },

    sample: function(size) {
      let lastIndex = element.length - 1;
      let randomIndex;
      if (size === undefined) {
        randomIndex = Math.floor(Math.random() * Math.floor(lastIndex));
        return element[randomIndex];
      } else {
        return makeSample(size);
      }
    },

    values: function() {
      let ownValues = [];
      for (const key in element) {
        if (element.hasOwnProperty(key)) ownValues.push(element[key]);
      }

      return ownValues;
    },

    where: function(object) {
      let elementSize = element.length;
      let foundObjects = [];

      for (let i = 0; i < elementSize; i += 1) {
        let currentElement = element[i];
        let objectKeys = findObjectKeys(object);

        let matchingKeys = findMatchingKeys(object, currentElement, objectKeys)
        if (matchingKeys.length === objectKeys.length) {
          foundObjects.push(currentElement);
        }
      }

      return foundObjects;
    },

    without: function(...args) {
      return element.reduce((newArr, elem) => {
        if (!args.includes(elem)) newArr.push(elem);
        return newArr;
      }, []);
    }
  }

  return u;
}

_.isArray = function(instance) {
  return _(instance).isArray();
}

_.isBoolean = function(instance) {
  return _(instance).isBoolean();
}

_.isFunction = function(instance) {
  return _(instance).isFunction();
}

_.isNumber = function(instance) {
  return _(instance).isNumber();
}

_.isObject = function(instance) {
  return _(instance).isObject();
}

_.isString = function(instance) {
  return _(instance).isString();
}

_.extend = function(target, ...sources) {
  let numberOfSources = sources.length;
  for (let i = 0; i < numberOfSources; i += 1)  {
    let source = sources[i];
    for (const key in source) {
      if (source.hasOwnProperty(key)) {
        target[key] = source[key];
      }
    }
  }

  return target;
}

_.range = function(...args) {
  let start, end, length;
  args.length === 1 ? [start, end] = [0, args[0]] : [start, end] = [args[0], args[1]];
  length = end - start;

  return Array.from( { length },(_, i) =>  start + i );
}

export { _ };