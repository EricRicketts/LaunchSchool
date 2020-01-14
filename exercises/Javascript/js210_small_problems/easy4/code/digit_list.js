function digitList(num) {
  return (num).toString().split('').map((char) => Number.parseInt(char, 10) );
}

export { digitList };