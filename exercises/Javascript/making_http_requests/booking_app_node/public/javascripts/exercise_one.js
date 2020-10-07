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

function getPersonnelOrSchedulesTotals(personOrSchedulePath, PERSONNEL_OR_SCHEDULES_API) {
  let staffRow = document.getElementById('staff');
  let studentRow = document.getElementById('students');
  let scheduleRow = document.getElementById('schedules');

  let request = new XMLHttpRequest();
  request.open('GET', PERSONNEL_OR_SCHEDULES_API + personOrSchedulePath);
  request.responseType = 'json';
  request.addEventListener('load', event => {
    let personnelOrSchedules = event.target.response;
    switch(personOrSchedulePath) {
      case '/staff_members': {
        addNumberOf(personnelOrSchedules, staffRow);
        break;
      } case '/students': {
        addNumberOf(personnelOrSchedules, studentRow);
        break;
      }
      case '/schedules': {
        addNumberOf(personnelOrSchedules, scheduleRow);
        numberOfSchedulesWithBookings(personnelOrSchedules, scheduleRow);
        numberOfStaffWithSchedules(personnelOrSchedules, staffRow);
        numberOfStudentsWithBookings(personnelOrSchedules, studentRow);
        break;
      }
    }
  });
  request.send();
}

document.addEventListener('DOMContentLoaded', () => {
  const PERSONNEL_OR_SCHEDULES_API = 'http://localhost:3000/api';
  let personnelOrSchedulesPaths = ['/staff_members', '/students', '/schedules'];

  personnelOrSchedulesPaths.forEach(personOrSchedulePath => {
    getPersonnelOrSchedulesTotals(personOrSchedulePath, PERSONNEL_OR_SCHEDULES_API);
  });
});