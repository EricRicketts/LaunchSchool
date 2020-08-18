function makeBold(element, cssClass, fn) {
  if (!fn) {
    element.classList.add('highlight');
  } else {
    fn(element, cssClass);
  }
}

module.exports = makeBold;