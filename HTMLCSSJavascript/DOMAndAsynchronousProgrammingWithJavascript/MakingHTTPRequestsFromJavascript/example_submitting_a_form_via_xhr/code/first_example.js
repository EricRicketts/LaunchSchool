document.addEventListener('DOMContentLoaded', () => {
  let responseDiv = document.getElementById('response');
  const DOMAIN = 'https://ls-230-book-catalog.herokuapp.com/books';
  let headerName = 'Content-Type';
  let headerValue = 'application/x-www-form-urlencoded';
  let data = 'title=Effective%20Javascript&author=David%20Herman';

  let xhr = new XMLHttpRequest();
  xhr.open('POST', DOMAIN);
  xhr.setRequestHeader(headerName, headerValue);

  xhr.addEventListener('load', () => {
    [`Response Status: ${xhr.status}`, `Response Text: ${xhr.responseText}`].forEach(string => {
      let par = document.createElement('p');
      let text = document.createTextNode(string);
      par.appendChild(text);
      responseDiv.appendChild(par);
    });
  });
  xhr.send(data);
});