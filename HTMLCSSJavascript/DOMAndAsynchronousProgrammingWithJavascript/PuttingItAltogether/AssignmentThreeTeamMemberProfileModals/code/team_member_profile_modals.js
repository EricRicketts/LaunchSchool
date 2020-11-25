function createModalCloseElement(document) {
  let modalCloseAnchor = document.createElement('a');
  modalCloseAnchor.setAttribute('href', '#');
  let modalCloseAnchorImg = document.createElement('img');
  modalCloseAnchorImg.setAttribute('src', 'images/icon_close.png');
  modalCloseAnchor.appendChild(modalCloseAnchorImg);

  return modalCloseAnchor;
}
function createTeamMemberBio(document, modalString) {
  let teamMemberBio = document.createElement('p');
  let text = document.createTextNode(modalString);
  teamMemberBio.appendChild(text);

  return teamMemberBio;
}
function createTeamMemberImageAndName(document, img) {
  let teamMemberImageSrc = img.getAttribute('src');
  let teamMemberAlt = img.getAttribute('alt');
  let text = document.createTextNode(teamMemberAlt);

  let teamMemberImage = document.createElement('img')
  teamMemberImage.setAttribute('src', teamMemberImageSrc);
  teamMemberImage.setAttribute('alt', teamMemberAlt);

  return [teamMemberImage, text];
}
function createTeamMemberName(document, name) {
  let teamMemberName = document.createElement('h3');
  teamMemberName.appendChild(name);

  return teamMemberName;
}
function instantiateModals(event, document) {
  const modalString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor" +
    " incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation" +
    " ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit" +
    " in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat" +
    " non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  let img = event.target.nodeName === 'IMG' ? event.target : event.target.querySelector('img');
  let modal = document.createElement('modal');

  let [teamMemberImage, name] = createTeamMemberImageAndName(document, img);
  let teamMemberName = createTeamMemberName(document, name);
  let teamMemberBio = createTeamMemberBio(document, modalString);
  let modalCloseAnchor = createModalCloseElement(document);

  [
    modalCloseAnchor, teamMemberImage,
    teamMemberName, teamMemberBio
  ].forEach(element => modal.appendChild(element));

  modal.setAttribute('id', 'modal');
  let headerElement = document.querySelector('header');
  document.body.insertBefore(modal, headerElement);

  modal.querySelector('a').addEventListener('click', event => {
    event.preventDefault();
    modal.remove();
  });
}
document.addEventListener('DOMContentLoaded', function() {
  const teamPageRegex = /team\.html/;
  if (teamPageRegex.test(window.location.href)) {
    let teamPageAnchors = document.querySelectorAll('article a');
    Array.from(teamPageAnchors).forEach(anchor => {
      anchor.addEventListener('click', event => instantiateModals(event, document));
    });
  }
});
