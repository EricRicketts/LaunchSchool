document.addEventListener('DOMContentLoaded', () => {
  let body = document.querySelector('body');
  let main = document.querySelector('body > main');
  let deletedHeader = body.removeChild(document.querySelector('body > header'));
  let deletedH1 = main.removeChild(document.querySelector('body > main > h1'));
  deletedHeader.insertAdjacentElement('afterbegin', deletedH1);
  body.insertAdjacentElement('afterbegin', deletedHeader);

  let firstFigure = document.querySelector('figure:nth-of-type(1)');
  let secondFigure = document.querySelector('figure:nth-of-type(2)');

  let [currentFirstImage, currentSecondImage] = document.querySelectorAll('img');
  let desiredFirstImage = currentSecondImage.cloneNode(true);
  let desiredSecondImage = currentFirstImage.cloneNode(true);

  firstFigure.replaceChild(desiredFirstImage, currentFirstImage);
  secondFigure.replaceChild(desiredSecondImage, currentSecondImage);
});