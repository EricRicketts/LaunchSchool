function buyFruit(array) {
  return array.reduce(function(list, itemAndCount) {
    return list.concat(expandArray(itemAndCount));
  }, []);
}

function buyFruitLaunchSchool(array) {
  return array.map(function(itemAndCount) {
    return repeat(itemAndCount);
  }).reduce(function(groceryList, fruit) {
    return groceryList.concat(fruit);
  })
}

function expandArray(subArr) {
  let value = subArr[0];
  let size = subArr[1];

  return Array(size).fill(value);
}

function repeat(fruit) {
  let result = [];
  let iterations = fruit[1];
  let value = fruit[0];

  for (let i = 0; i < iterations; i += 1) {
    result.push(value);
  }

  return result;
}

export { buyFruit, buyFruitLaunchSchool };