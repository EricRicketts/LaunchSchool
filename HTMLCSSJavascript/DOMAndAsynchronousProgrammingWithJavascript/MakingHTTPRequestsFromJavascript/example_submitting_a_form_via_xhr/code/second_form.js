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

    let data = new FormData(form);

    let xhr = new XMLHttpRequest();
    xhr.open('POST', DOMAIN);

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