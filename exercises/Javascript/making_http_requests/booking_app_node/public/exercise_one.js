function addNumberOf(items, row) {
  let number = items.length;
  let cell = row.querySelector('td.number');
  let text = document.createTextNode(number.toString());
  cell.appendChild(text);
}
function numberOfSchedulesWithBookings(schedules, scheduleRow) {
  let numberOfBookings = Array.from(schedules).filter(schedule => schedule["student_email"] !== null).length;
  let text = document.createTextNode(numberOfBookings.toString());
  let cell = scheduleRow.querySelector('td:nth-of-type(3)');
  cell.appendChild(text);
}

function numberOfStaffWithSchedules(schedules, staffRow) {
  let staffIds = Array.from(schedules).map(schedule => schedule["staff_id"]);
  let uniqueIds = staffIds.reduce((ids, id) => {
      if (!ids.includes(id)) { ids.push(id) };
      return ids;
  }, []);
  let text = document.createTextNode(uniqueIds.length.toString());
  let cell = staffRow.querySelector('td:nth-of-type(4)');
  cell.appendChild(text);
}

function numberOfStudentsWithBookings(schedules, studentRow) {
  let studentEmails = Array.from(schedules).map(schedule => schedule['student_email']).filter(email => email !== null);
  let uniqueStudentEmails = studentEmails.reduce((emails, email) => {
    if (!emails.includes(email)) { emails.push(email) };
    return emails;
  }, []);
  let text = document.createTextNode(uniqueStudentEmails.length.toString());
  let cell = studentRow.querySelector('td:nth-of-type(3)');
  cell.appendChild(text);
}

function makeRequestForTotalNumberOf(item, row, DOMAIN) {
  let request = new XMLHttpRequest();
  request.open('GET', DOMAIN + item);
  request.responseType = 'json';
  request.addEventListener('load', event => {
    let items = event.target.response;
    addNumberOf(items, row);
    switch (item) {
      case '/schedules': {
        let staffRow = document.getElementById('staff');
        let studentRow = document.getElementById('students');
        numberOfSchedulesWithBookings(items, row);
        numberOfStaffWithSchedules(items, staffRow);
        numberOfStudentsWithBookings(items, studentRow);
        break;
      }
    }
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