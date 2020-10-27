document.addEventListener('DOMContentLoaded', () => {
  let responseDiv = document.getElementById('response');
  const DOMAIN = 'https://ls-230-book-catalog.herokuapp.com/books';
  let headerName = 'Content-Type';
  let headerValue = 'application/x-www-form-urlencoded';
  let data = 'title=Effective%20Javascript&author=David%20Herman';

  let xhr = new XMLHttpRequest();
  xhr.open('POST', DOMAIN);
  xhr.setRequestHeader(headerName, headerValue);

  xhr.addEventListener('load', event => {
    let responseObject = JSON.parse(event.target.response);
    [`Response Status: ${event.target.status}`, 'Response Object:'].forEach(str => {
      let p = document.createElement('p');
      let text = document.createTextNode(str);
      p.appendChild(text);
      responseDiv.appendChild(p);
    });
    Object.entries(responseObject).forEach(arr => {
      let key = arr[0];
      let value = arr[1];
      let p = document.createElement('p');
      let text = document.createTextNode(`${key}: ${value}`);
      p.appendChild(text);
      responseDiv.appendChild(p);
    });
  });
  xhr.send(data);
});