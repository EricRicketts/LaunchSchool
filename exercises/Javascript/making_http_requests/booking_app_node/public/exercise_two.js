function updateTableWithStaffTotals(staffAndSchedulesTotals) {
  let tableBody = document.querySelector('table > tbody');
  Object.entries(staffAndSchedulesTotals).forEach(arr => {
    let tr = document.createElement('tr');
    for (let index = 0; index < 2; index += 1) {
      let td = document.createElement('td');
      let text = document.createTextNode(arr[index].toString());
      td.appendChild(text);
      tr.appendChild(td);
    }
    tableBody.appendChild(tr);
  });
}

document.addEventListener('DOMContentLoaded', () => {
  const API = 'http://localhost:3000/api';
  const SCHEDULES_PATH = '/schedules';

  let request = new XMLHttpRequest();
  request.open('GET', API + SCHEDULES_PATH);
  request.responseType = 'json';
  request.addEventListener('load', event => {
    let schedules = event.target.response;
    let staffAndSchedulesTotals = Array.from(schedules).reduce((obj, schedule) => {
      let staffId = schedule["staff_id"].toString();
      obj[staffId] =  obj[staffId] + 1 || 1;
      return obj;
    }, {});
    updateTableWithStaffTotals(staffAndSchedulesTotals);
  });
  request.send();
});