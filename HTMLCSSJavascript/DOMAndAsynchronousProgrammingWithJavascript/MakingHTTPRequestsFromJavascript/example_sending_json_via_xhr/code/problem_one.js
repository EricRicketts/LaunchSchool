document.addEventListener('DOMContentLoaded',() => {
  const DOMAIN = 'https://ls-230-book-catalog.herokuapp.com/books';
  let result = document.getElementById('result');
  let xhr = new XMLHttpRequest();
  xhr.open('POST', DOMAIN);
  xhr.setRequestHeader('Content-Type', 'application/json');
  let data = { title: 'Eloquent Javascript', author: 'Martin Haverbeke' };
  let json = JSON.stringify(data);
  xhr.addEventListener('load', event => {
    let response = event.target.response
    let obj = JSON.parse(response);
    Object.keys(obj).forEach(key => {
      let p = document.createElement('p');
      let str = `${key}: ${obj[key]}`;
      let text = document.createTextNode(str);
      p.appendChild(text);
      result.appendChild(p);
    })
  });
  xhr.send(json);
});