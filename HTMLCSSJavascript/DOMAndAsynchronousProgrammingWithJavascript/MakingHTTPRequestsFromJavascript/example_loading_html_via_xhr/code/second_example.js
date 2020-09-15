document.addEventListener('DOMContentLoaded', () => {
  const PRODUCTS_DOMAIN = 'https://ls-230-web-store-demo.herokuapp.com/products';
  const DOMAIN = 'https://ls-230-web-store-demo.herokuapp.com';
  let store = document.getElementById('store');
  let xhr = new XMLHttpRequest();
  xhr.open('GET', PRODUCTS_DOMAIN);
  xhr.addEventListener('load', () => store.innerHTML = xhr.responseText);
  xhr.send();

  document.addEventListener('click', event => {
    if (event.target.tagName !== 'A') {
      return;
    }
    event.preventDefault();
    let path = event.target.getAttribute('href');
    let xhr = new XMLHttpRequest();
    xhr.open('GET', DOMAIN + path);
    xhr.addEventListener('load', () => store.innerHTML = xhr.responseText);
    xhr.send();
  });
});