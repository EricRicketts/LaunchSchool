document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'http://date.jsontest.com';
  let tableBody = document.querySelector('#response-table > tbody');
  let button = document.querySelector('button');
  button.addEventListener('click', () => {
    let xhr = new XMLHttpRequest();
    xhr.addEventListener('loadend', event => {
      let response = event.currentTarget;
      let responseObject = JSON.parse(response.responseText);
      Object.keys(responseObject).forEach(key => {
        let row = document.createElement('tr');
        let dateParameter = document.createElement('td');
        let dateParameterText = document.createTextNode(key);
        dateParameter.appendChild(dateParameterText);
        let dateValue = document.createElement('td');
        let dateValueText = document.createTextNode(responseObject[key]);
        dateValue.appendChild(dateValueText);
        row.append(dateParameter, dateValue);
        tableBody.appendChild(row);
      });
    });
    xhr.open('GET', DOMAIN);
    xhr.send();
  });
});