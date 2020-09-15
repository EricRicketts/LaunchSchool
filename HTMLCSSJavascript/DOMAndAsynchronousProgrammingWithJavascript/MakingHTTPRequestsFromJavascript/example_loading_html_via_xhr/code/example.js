document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'https://ls-230-web-store-demo.herokuapp.com/products';
  let store = document.getElementById('store');
  let xhr = new XMLHttpRequest();
  xhr.open('GET', DOMAIN);
  xhr.addEventListener('load', event => {
    let request = event.currentTarget;
    store.innerHTML = request.responseText;
  });
  xhr.send();
});
