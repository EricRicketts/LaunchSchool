function selectAndDisplayMainFigure(mainFigure, selectedImg) {
  let mainFigureImage = mainFigure.firstElementChild;

  let selectedImgIsHidden = mainFigure.classList.contains('hide') &&
    mainFigureImage.dataset.imgHolder === selectedImg.dataset.imgHolder;

  let nonSelectedImgIsNotHidden = !mainFigure.classList.contains('hide') &&
    mainFigureImage.dataset.imgHolder !== selectedImg.dataset.imgHolder;

  if (selectedImgIsHidden) {
    mainFigure.classList.toggle('hide');
  } else if (nonSelectedImgIsNotHidden) {
    mainFigure.classList.toggle('hide');
  }

}
function selectAndStyleThumbNailImage(thumbNailImages, selectedImg) {
  thumbNailImages.forEach(img => {
    let selectedImgIsNotActive = selectedImg === img &&
      !selectedImg.classList.contains('active');

    if (selectedImgIsNotActive) {
      selectedImg.classList.toggle('active');
    } else if (selectedImg !== img) {
      img.removeAttribute('class');
    }
  });
}
document.addEventListener('DOMContentLoaded', function() {
  let thumbNailImages = document.querySelectorAll('ul > li > a > img');
  let mainFigures = document.querySelectorAll('figure');

  thumbNailImages.forEach(thumbNailImage => {
    thumbNailImage.addEventListener('click', event => {
      event.preventDefault();
      let selectedImg = event.target;
      selectAndStyleThumbNailImage(thumbNailImages, selectedImg);

      mainFigures.forEach(mainFigure => selectAndDisplayMainFigure(mainFigure, selectedImg));
    });
  });
});
