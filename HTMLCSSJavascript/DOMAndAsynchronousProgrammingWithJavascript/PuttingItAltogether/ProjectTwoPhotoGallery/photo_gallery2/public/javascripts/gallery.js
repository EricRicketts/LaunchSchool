function addCommentFormHandler(event, templates, document) {
  event.preventDefault();
  let photoComments = document.querySelector('#comments > ul');
  let form = event.target;
  let formData = new FormData(form);

  let urlEncodedData = Array.from(formData.entries()).reduce((arr, data) => {
    let key = data[0];
    let value = data[1];
    let str = encodeURIComponent(key) + '=' + encodeURIComponent(value);
    arr.push(str)
    return arr;
  }, []).join('&');

  let formXhr = new XMLHttpRequest();
  formXhr.open('POST', form.getAttribute('action'))
  formXhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
  formXhr.send(urlEncodedData);
  form.reset();

  formXhr.addEventListener('load', event => {
    let response = JSON.parse(event.target.response);
    let comment = { gravatar: response.gravatar, name: response.name, date: response.date, body: response.body };
    photoComments.insertAdjacentHTML('beforeend', templates['photo_comment'](comment));
  });
}
function photoInformationHandler(event, document) {
  event.preventDefault();
  let button = event.target;
  let buttonType = button.dataset.property;

  if (buttonType) {
    let href = button.getAttribute('href');
    let dataId = button.dataset.id;
    let photoInformationXhr = new XMLHttpRequest();
    photoInformationXhr.open('POST', href);
    photoInformationXhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    photoInformationXhr.send('photo_id=' + dataId);

    photoInformationXhr.addEventListener('load', event => {
      let response = JSON.parse(event.target.response);
      button.textContent = button.textContent.replace(/\d+/, response.total.toString());
    })
  }
}
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
  removeAllChildren(photoInformation);

  let photoInformationTemplate = templates["photo_information"];
  let photoInformationHTML = photoInformationTemplate(desiredPhoto);

  photoInformation.insertAdjacentHTML('beforeend', photoInformationHTML);
}
function renderCommentsForDisplayedPhoto(photoId, templates, document) {
  const photoCommentURL = `http://localhost:3000/comments?photo_id=${photoId}`;
  let photoComments = document.getElementById('comments').querySelector('ul');
  removeAllChildren(photoComments);

  let photoCommentXhr = new XMLHttpRequest();
  photoCommentXhr.open('GET', photoCommentURL);
  photoCommentXhr.send();

  photoCommentXhr.addEventListener('load', event => {
    let comments = JSON.parse(event.target.response);
    photoComments.insertAdjacentHTML('beforeend', templates['photo_comments']({ comments: comments }));
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
function slideHandler(event, document, increment, templates, allPhotos) {
  event.preventDefault();
  let slides = document.getElementById('slides');
  if (slides.children.length === 0) { return; }

  let newSlideOrder = rotateSlides(slides, increment);
  removeAllChildren(slides);
  newSlideOrder.forEach(slide => {
    slides.appendChild(slide);
  });

  let firstSlideId = newSlideOrder[0].dataset.id;
  let desiredPhoto = allPhotos.find(photo => photo.id == firstSlideId);
  renderInformationForDisplayedPhoto(desiredPhoto, templates, document);
  renderCommentsForDisplayedPhoto(desiredPhoto.id, templates, document);
  updateHiddenFormInput(document);
}
function updateHiddenFormInput(document) {
  let hiddenInput = document.querySelector('form > fieldset > input[type="hidden"]');
  let desiredPhoto = document.querySelector('#slides > figure:first-of-type');

  hiddenInput.setAttribute('value', desiredPhoto.dataset.id);
}
document.addEventListener('DOMContentLoaded', function() {
  let nextSlide = document.querySelector('a.next');
  let previousSlide = document.querySelector('a.prev');
  let photoInformation = document.querySelector('section > header');
  let commentForm = document.querySelector('form');
  let allPhotos;
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
    allPhotos = JSON.parse(event.target.response);
    renderAllPhotos(allPhotos, templates, document);
    renderInformationForDisplayedPhoto(allPhotos[0], templates, document);
    renderCommentsForDisplayedPhoto(allPhotos[0].id, templates, document);
    updateHiddenFormInput(document);
  });

  nextSlide.addEventListener('click', event => {
    slideHandler(event, document, 1, templates, allPhotos);
  });
  previousSlide.addEventListener('click', event => {
    slideHandler(event, document, -1, templates, allPhotos);
  });

  photoInformation.addEventListener('click', event => photoInformationHandler(event, document));
  commentForm.addEventListener('submit', event => addCommentFormHandler(event, templates, document));
});

