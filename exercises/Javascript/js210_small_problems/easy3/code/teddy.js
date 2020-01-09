function getRandomInt(min, max) {
  var min = Math.ceil(min);
  var max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function teddy() {
  var age = getRandomInt(20, 200);
  return "Teddy is " + age + " years old!";
}

export { teddy };