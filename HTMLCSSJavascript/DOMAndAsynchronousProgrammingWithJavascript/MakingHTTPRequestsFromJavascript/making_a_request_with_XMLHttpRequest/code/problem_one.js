document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'https://api.github.com/repos/rails/rails';
  let div = document.getElementById('response');

  let request = new XMLHttpRequest();

  request.addEventListener('load', event => {
    let request = event.target;
    let responseBody = document.createTextNode(request.responseText);
    div.appendChild(responseBody);
  });

  request.open('GET', DOMAIN);
  request.send();
});