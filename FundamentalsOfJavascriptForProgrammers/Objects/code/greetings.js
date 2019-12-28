function greetings(arr, obj) {
  var strArr = arr.join(' ');
  return 'Hello, ' + strArr + "!  " + 'Nice to have a ' + obj.title + ' ' + obj.occupation + ' around.';
}

export { greetings };