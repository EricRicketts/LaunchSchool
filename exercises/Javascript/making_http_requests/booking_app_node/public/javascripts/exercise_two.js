function removeAllChildNodes(parent) {
  while (parent.firstChild) {
    parent.removeChild(parent.firstChild);
  }
}

function updateTableWithStaffTotals(staffAndSchedulesTotals) {
  let tableBody = document.querySelector('table > tbody');
  removeAllChildNodes(tableBody);
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
  let button = document.querySelector('button');

  button.addEventListener('click', () => {
    let request = new XMLHttpRequest();
    request.open('GET', API + SCHEDULES_PATH);
    request.responseType = 'json';
    request.timeout = 5000;
    request.addEventListener('load', event => {
      let schedules = event.target.response;
      if (Array.from(schedules).length === 0) {
        Swal.fire({
          icon: 'info',
          title: 'Information',
          text: 'Successful request but the server had no data'
        });
      } else {
        let staffAndSchedulesTotals = Array.from(schedules).reduce((obj, schedule) => {
          let staffId = schedule["staff_id"].toString();
          obj[staffId] =  obj[staffId] + 1 || 1;
          return obj;
        }, {});
        updateTableWithStaffTotals(staffAndSchedulesTotals);
        Swal.fire({
          icon: 'success',
          title: 'Success',
          text: 'Data exists and has been inserted into the table'
        });
      }
    });
    request.addEventListener('timeout', event => {
      Swal.fire({
        icon: 'error',
        title: 'Oops',
        text: 'A timeout occurred, please resubmit'
      });
    });
    request.send();
  });
});