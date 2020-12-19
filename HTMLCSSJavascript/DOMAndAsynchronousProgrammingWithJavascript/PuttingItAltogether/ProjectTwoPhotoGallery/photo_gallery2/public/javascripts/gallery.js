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
document.addEventListener('DOMContentLoaded', function() {
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
  });
});