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
    xhr.addEventListener('load', event => store.innerHTML = event.target.responseText);
    xhr.send();
  });
});

/*
 Each product in our final example has an edit form that you access by clicking first on the item link, and
 then on "Edit this product." The code, though, incorrectly handles the form when you submit it.

1. What prevents the form submission from working? Investigate the problem with the web developer tools in
your browser.

this happens because the form after being filled out is submitted via a normal POST request, but the URL for the
POST request is incorrect, file:///products/1 (actually products/1 or products/2 or products/3).  This happened
because it followed the default browser behavior and just took that URL from the form, which turned out to be
incorrect.
*/