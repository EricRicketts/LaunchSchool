document.addEventListener('DOMContentLoaded', () => {
  let body = document.querySelector('body');
  let main = document.querySelector('body > main');
  let deletedHeader = body.removeChild(document.querySelector('body > header'));
  let deletedH1 = main.removeChild(document.querySelector('body > main > h1'));
  deletedHeader.insertAdjacentElement('afterbegin', deletedH1);
  body.insertAdjacentElement('afterbegin', deletedHeader);

  let firstFigure = document.querySelector('figure:nth-of-type(1)');
  let secondFigure = document.querySelector('figure:nth-of-type(2)');

  let desiredFirstImage = document.querySelector('figure:nth-of-type(2) > img');
  let currentFirstImage = document.querySelector('figure:nth-of-type(1) > img');
  let desiredSecondImage = firstFigure.replaceChild(desiredFirstImage, currentFirstImage);
  secondFigure.insertAdjacentElement('afterbegin', desiredSecondImage);
});