document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'https://ls-230-web-store-demo.herokuapp.com/v1/products';
  const HEADERS = { 'Content-Type': 'application/json', 'Authorization': 'token AUTH_TOKEN' };
  let initial = document.getElementById('initial');
  let tableBody = document.querySelector('#initial > tbody');
  let allEntriesButton = document.getElementById('all-entries');
  let addEntryButton = document.getElementById('add-entry');
  let clearButton = document.getElementById('clear');
  let xhr;
  let request;
  let products;
  let data;
  let json;

  function createProductData(tr, product) {
    let orderedProductValues = [];
    let productKeys = Object.keys(product);
    productKeys.forEach(productKey => {
      let td = document.createElement('td');
      let text = document.createTextNode(product[productKey]);
      td.appendChild(text);
      tr.appendChild(td);
    });
  }

  function removeAllChildren(parent) {
    while (parent.hasChildNodes()) {
      parent.removeChild(parent.firstChild);
    }
  }

  allEntriesButton.addEventListener('click', event => {
    event.preventDefault();
    xhr = new XMLHttpRequest();
    xhr.open('GET', DOMAIN);
    xhr.responseType = 'json';
    xhr.addEventListener('load', event => {
      event.preventDefault();
      request = event.target;
      products = request.response;
      if (products !== '') {
        let productsArray = Array.from(products);
        productsArray.forEach(product => {
          let tr = document.createElement('tr');
          createProductData(tr, product);
          tableBody.appendChild(tr);
        });
      }
    });
    xhr.send();
  });
});