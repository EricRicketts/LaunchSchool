function copyProperties(source, target) {
  var count = 0;
  for (const key in source) {
    if (source.hasOwnProperty(key)) {
      target[key] = source[key];
      count += 1;
    }
  }

  return count;
}

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

function wordCount(str) {
  var obj = {};
  var words = str.split(/\s+/);
  words.forEach(word => {
    obj[word] = obj[word] ? obj[word] + 1 : 1;
  });

  return obj;
}

export { copyProperties, incrementProperty, objectHasProperty, wordCount };