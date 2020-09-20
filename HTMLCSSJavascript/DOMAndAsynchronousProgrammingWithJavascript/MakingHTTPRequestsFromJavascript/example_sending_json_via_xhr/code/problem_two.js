document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'https://ls-230-web-store-demo.herokuapp.com/v1/products';
  const HEADERS = { 'Content-Type': 'application/json', 'Authorization': 'token AUTH_TOKEN' };
  let tableBody = document.querySelector('#initial > tbody');
  let allEntriesButton = document.getElementById('all-entries');
  let clearButton = document.getElementById('clear-entries');
  let form = document.getElementById('form');
  let xhr;
  let request;
  let products;
  let data;
  let json;

  function createProductData(tr, product) {
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

  form.addEventListener('submit', event => {
    event.preventDefault();
    let inputs = document.querySelectorAll('#form input[type="text"]');
    let inputArray = Array.from(inputs);
    let data = {}
    inputArray.forEach(input => {
      data[input.name] = input.value;
    });
    json = JSON.stringify(data);

    xhr = new XMLHttpRequest();
    xhr.open('POST', DOMAIN);
    Object.keys(HEADERS).forEach(header => {
      xhr.setRequestHeader(header, HEADERS[header]);
    });

    xhr.addEventListener('load', event => {
      if (event.target.status === 201) {
        console.log('response received');
      }
    });
    xhr.send(json);
  })

  clearButton.addEventListener('click', event => {
    event.preventDefault();
    removeAllChildren(tableBody);
  });
});