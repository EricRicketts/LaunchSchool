function encodeFormElements(form) {
  let keysAndValues = [];
  let key;
  let value;
  let elementsArray = Array.from(form.elements);

  elementsArray.forEach(element => {
    if (element.type !== 'submit') {
      key = encodeURIComponent(element.name);
      value = encodeURIComponent(element.value);
      keysAndValues.push(`${key}=${value}`);
    }
  });

  return keysAndValues;
}

function removeAllChildren(parent) {
  while (parent.hasChildNodes()) {
    parent.removeChild(parent.firstChild);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'https://ls-230-book-catalog.herokuapp.com/books';
  let form = document.getElementById('form');
  let results = document.getElementById('results');
  removeAllChildren(results);

  form.addEventListener('submit', event => {
    event.preventDefault(); // we need to do this because we do not want the browser submitting the form

    let data = encodeFormElements(form).join('&');

    let xhr = new XMLHttpRequest();
    xhr.open('POST', DOMAIN);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.addEventListener('load', () => {
      if (xhr.status === 201) {
          let p1 = document.createElement('p');
          let text = document.createTextNode(`Response status: 201`);
          p1.appendChild(text);
          let p2 = document.createElement('p');
          text = document.createTextNode(`Response body: ${xhr.responseText}`)
          p2.appendChild(text);
          results.append(p1, p2);
      }
    });
    xhr.send(data);
  });
});