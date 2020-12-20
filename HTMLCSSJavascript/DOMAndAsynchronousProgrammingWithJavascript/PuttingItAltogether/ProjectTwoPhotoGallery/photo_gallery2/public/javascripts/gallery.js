function removeAllChildren(parent) {
  while (parent.firstChild) {
    parent.removeChild(parent.lastChild);
  }
}
function renderAllPhotos(allPhotos, templates, document) {
  let divSlides = document.getElementById('slides');
  divSlides.insertAdjacentHTML('beforeend', templates['photos']({ photos: allPhotos }));
}
function renderInformationForDisplayedPhoto(desiredPhoto, templates, document) {
  let photoInformation = document.querySelector('section > header');
  let photoInformationTemplate = templates["photo_information"];
  let photoInformationHTML = photoInformationTemplate(desiredPhoto);

  photoInformation.insertAdjacentHTML('beforeend', photoInformationHTML);
}
function renderCommentsForDisplayedPhoto(photoId, templates, document) {
  const photoCommentURL = `http://localhost:3000/comments?photo_id=${photoId}`;
  let photoComment = document.getElementById('comments').querySelector('ul');

  let photoCommentXhr = new XMLHttpRequest();
  photoCommentXhr.open('GET', photoCommentURL);
  photoCommentXhr.send();

  photoCommentXhr.addEventListener('load', event => {
    let comments = JSON.parse(event.target.response);
    photoComment.insertAdjacentHTML('beforeend', templates['photo_comments']({ comments: comments }));
  });
}
function rotateSlides(slides, increment) {
  let slidesArray = Array.from(slides.children);
  let numberOfSlides = slidesArray.length;
  let newSlideOrder = [];

  slidesArray.forEach((slide, idx) => {
    let nextIndex;
    if (increment >= 0) {
      nextIndex = (idx + increment) % numberOfSlides;
    } else {
      nextIndex = (idx + increment + numberOfSlides) % numberOfSlides;
    }
    let nextSlide = slidesArray[nextIndex];
    newSlideOrder.push(nextSlide);
  });

  return newSlideOrder;
}
function slideHandler(event, document, increment) {
  event.preventDefault();
  let slides = document.getElementById('slides');
  if (slides.children.length === 0) { return; }

  let newSlideOrder = rotateSlides(slides, increment);
  removeAllChildren(slides);
  newSlideOrder.forEach(slide => {
    slides.appendChild(slide);
  });
}
document.addEventListener('DOMContentLoaded', function() {
  let nextSlide = document.querySelector('a.next');
  let previousSlide = document.querySelector('a.prev');
  let templates = {};

  document.querySelectorAll('script[type="text/x-handlebars"]').forEach(template => {
    templates[template["id"]] = Handlebars.compile(template["innerHTML"]);
  });
  document.querySelectorAll("[data-type=partial]").forEach(template => {
    Handlebars.registerPartial(template["id"], template["innerHTML"]);
  });

  const allPhotosURL = 'http://localhost:3000/photos';
  let initialXhr = new XMLHttpRequest();
  initialXhr.open('GET', allPhotosURL);
  initialXhr.send();

  initialXhr.addEventListener('load', event => {
    let allPhotos = JSON.parse(event.target.response);
    renderAllPhotos(allPhotos, templates, document);
    renderInformationForDisplayedPhoto(allPhotos[0], templates, document);
    renderCommentsForDisplayedPhoto(allPhotos[0].id, templates, document);
  });

  nextSlide.addEventListener('click', event => slideHandler(event, document, 1))
  previousSlide.addEventListener('click', event => slideHandler(event, document, -1))
});

/*
1 2 3
2 3 1
3 1 2
1 2 3
0 + 1 = 1, 2, 3, 1
1 + 1 = 2, 3, 1, 2
2 + 1 = 0  1, 2, 3


1 2 3
3 1 2
2 3 1
1 2 3
0 - 1 = 2, 3, 1, 2
2 - 1 = 1, 2, 3, 1
1 - 1 = 0, 1, 2, 3

(0 - 1 + 3) % 3 = 2
(2 - 1 + 3) % 3 = 1
(1 - 1 + 3) % 3 = 0
*/