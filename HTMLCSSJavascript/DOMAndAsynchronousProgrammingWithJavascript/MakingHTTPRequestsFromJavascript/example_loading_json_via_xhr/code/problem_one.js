document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'https://api.github.com/repos/rails/rails';
  let result = document.getElementById('result');
  let xhr = new XMLHttpRequest();
  xhr.responseType = 'json';
  xhr.open('GET', DOMAIN);

  function responseError(xhr) {
    let p = document.createElement('p');
    let text = document.createTextNode(`The request could not be completed!!  Response status: ${xhr.status}`);
    p.appendChild(text);
    result.appendChild(p);
  }

  function responseSuccess(xhr) {
    let response = xhr.response;
    [`Response status: ${xhr.status}`, `Response id: ${response.id}`].forEach(str => {
      let p = document.createElement('p');
      let text = document.createTextNode(str);
      p.appendChild(text);
      result.appendChild(p);
    });
  }

  xhr.addEventListener('load', event =>{
    let xhr = event.target;
    responseSuccess(xhr);
  });

  xhr.addEventListener('error', event => {
    let xhr = event.target;
    responseError(xhr);
  });
  xhr.send();
});