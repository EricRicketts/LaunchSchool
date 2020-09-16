document.addEventListener('DOMContentLoaded', () => {
  const PRODUCTS_DOMAIN = 'https://ls-230-web-store-demo.herokuapp.com/products';
  const DOMAIN = 'https://ls-230-web-store-demo.herokuapp.com';
  let store = document.getElementById('store');
  let xhr = new XMLHttpRequest();
  xhr.open('GET', PRODUCTS_DOMAIN);
  xhr.addEventListener('load', () => store.innerHTML = xhr.responseText);
  xhr.send();
  let path;

  store.addEventListener('click', event => {
    if (event.target.tagName !== 'A') {
      return;
    }
    event.preventDefault();
    path = event.target.getAttribute('href');
    xhr = new XMLHttpRequest();
    xhr.open('GET', DOMAIN + path);
    xhr.addEventListener('load', () => store.innerHTML = xhr.responseText);
    xhr.send();
  });

  store.addEventListener('submit', event => {
    event.preventDefault();
    let form = event.target;
    xhr = new XMLHttpRequest();
    let data = new FormData(form);

    xhr.open('POST', DOMAIN + `${form.getAttribute('action')}`);
    xhr.setRequestHeader('Authorization', 'token AUTH_TOKEN');
    xhr.addEventListener('load', () => store.innerHTML = xhr.response);
    xhr.send(data);
  })
});