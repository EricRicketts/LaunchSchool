let _ = function(element) {
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
    first: function() {
      return element[0];
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

    without: function(...args) {
      return element.reduce((newArr, elem) => {
        if (!args.includes(elem)) newArr.push(elem);
        return newArr;
      }, []);
    }
  }

  return u;
}

_.range = function(...args) {
  let start, end, length;
  args.length === 1 ? [start, end] = [0, args[0]] : [start, end] = [args[0], args[1]];
  length = end - start;

  return Array.from( { length },(_, i) =>  start + i );
}
export { _ };