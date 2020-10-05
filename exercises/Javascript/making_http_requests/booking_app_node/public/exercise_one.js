function addNumberOf(items, row) {
  let number = items.length;
  let cell = row.querySelector('td.number');
  let text = document.createTextNode(number.toString());
  cell.appendChild(text);
}

function makeRequestForTotalNumberOf(item, row, DOMAIN) {
  let request = new XMLHttpRequest();
  request.open('GET', DOMAIN + item);
  request.responseType = 'json';
  request.addEventListener('load', event => {
    let items = event.target.response;
    addNumberOf(items, row);
  });
  request.send();
}
document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'http://localhost:3000/api';
  let staffRow = document.getElementById('staff');
  let studentRow = document.getElementById('students');
  let scheduleRow = document.getElementById('schedules');
  let itemsAndRows = [
    ['/staff_members', staffRow], ['/students', studentRow], ['/schedules', scheduleRow]
  ];

  itemsAndRows.forEach(itemAndRow => {
    let item = itemAndRow[0];
    let row = itemAndRow[1];
    makeRequestForTotalNumberOf(item, row, DOMAIN);
  });
});