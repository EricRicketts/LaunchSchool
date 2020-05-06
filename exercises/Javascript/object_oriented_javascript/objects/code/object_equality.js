function objectsEqual(first, second) {
  let firstKeys = Object.getOwnPropertyNames(first).sort();
  let secondKeys = Object.getOwnPropertyNames(second).sort();

  if (firstKeys.length !== secondKeys.length) { return false; }

  return firstKeys.every((key, index) => {
    let firstKey = key;
    let secondKey = secondKeys[index];

    return (firstKey === secondKey) && (first[firstKey] === second[secondKey]);
  });
}

export { objectsEqual };