function bookingErrorHandler(event) {
  let response = event.target.responseText;
  let sequenceNumber = response.match(/\d+/)[0];
  if (event.target.status === 404) {
    alert(`${response}`);
    registerNewStudent(event, sequenceNumber);
  } else {
    return;
  }
}
function bookingFormHandler(form) {
  const domain = 'http://localhost:3000';
  let path = form.getAttribute('action');
  let bookingForm = form;
  let bookingFormData = {
    id: bookingForm.querySelector('#booking-select').value,
    student_email: bookingForm.querySelector('#student-email-booking').value
  };
  let bookingFormDataJson = JSON.stringify(bookingFormData);

  let bookingXhr = new XMLHttpRequest();
  bookingXhr.open('POST', domain + path);
  bookingXhr.setRequestHeader('Content-Type', 'application/json');
  bookingXhr.send(bookingFormDataJson);
  bookingXhr.addEventListener('load', bookingResponseHandler)

}
function bookingResponseHandler(event) {
  if (event.target.status === 204) {
    alert('Booked');
    return;
  } else {
    bookingErrorHandler(event);
  }
}
function createOptionTagDataAndAppendToSelectTag(event, bookingOptionTagData) {
  let allStaff = JSON.parse(event.target.response);
  let bookingSelectTag = document.querySelector('#booking-select');

  bookingOptionTagData.forEach(tagDataItem => {
    let staffId = tagDataItem.staff_id;
    let desiredStaffData = allStaff.find(staffMember => staffMember.id === staffId);
    tagDataItem.staff_name = desiredStaffData.name;

    let bookingOptionTag = document.createElement('option');
    bookingOptionTag.setAttribute('value', `${tagDataItem.id}`);
    let bookingOptionStr = `${tagDataItem.staff_name} | ${tagDataItem.date} | ${tagDataItem.time}`;
    let bookingOptionTagText = document.createTextNode(bookingOptionStr);

    bookingOptionTag.appendChild(bookingOptionTagText);
    bookingSelectTag.appendChild(bookingOptionTag);
  });
}
function newStudentFormHandler(event, bookingForm) {
  const domain = 'http://localhost:3000';
  let newStudentForm = event.target;
  let path = newStudentForm.getAttribute('action');
  let newStudentFormData = Array.from(new FormData(newStudentForm).entries()).reduce((obj, arr) => {
    let [key, value] = [arr[0], arr[1]];
    obj[key] = value;
    return obj;
  }, {});
  let newStudentFormDataJson = JSON.stringify(newStudentFormData);

  let newStudentXhr = new XMLHttpRequest();
  newStudentXhr.open('POST', domain + path);
  newStudentXhr.setRequestHeader('Content-Type', 'application/json');
  newStudentXhr.send(newStudentFormDataJson);

  newStudentXhr.addEventListener('load', event => {
    let statusCode = event.target.status;
    let responseText = event.target.responseText;
    if (statusCode === 201) {
      alert(`${responseText}`);
      bookingFormHandler(bookingForm);
    } else if (statusCode === 400 || statusCode === 403) {
      alert(`${responseText}`);
    } else {
      return;
    }
  });
}
function populateBookingSelectTag(event) {
  const apiStaffMembers = 'http://localhost:3000/api/staff_members';

  let allSchedules = JSON.parse(event.target.response);
  let nonBookedSchedules = allSchedules.filter(schedule => schedule.student_email === null);
  let bookingOptionTagData = nonBookedSchedules.map(prepareBookingOptionTagData);

  let allStaffXhr = new XMLHttpRequest();
  allStaffXhr.open('GET', apiStaffMembers);
  allStaffXhr.send();

  allStaffXhr.addEventListener('load', event => {
    createOptionTagDataAndAppendToSelectTag(event, bookingOptionTagData);
  });
}
function prepareBookingOptionTagData(schedule) {
  let optionTagData = {};
  optionTagData.id = schedule.id;
  optionTagData.staff_id = schedule.staff_id;
  optionTagData.staff_name = '';
  optionTagData.date = schedule.date;
  optionTagData.time = schedule.time;
  return optionTagData;
}
function registerNewStudent(event, sequenceNumber) {
  let newStudentForm = document.getElementById('new-student-form');
  let bookingForm = document.getElementById('booking-form');

  let newStudentEmail = bookingForm.querySelector('#student-email-booking').value;
  newStudentForm.querySelector('#student-email-new-student').value = newStudentEmail;
  newStudentForm.querySelector('#booking-sequence').value = Number(sequenceNumber);
  newStudentForm.style.display = 'flex';

  newStudentForm.addEventListener('submit', event => {
    event.preventDefault();
    newStudentFormHandler(event, bookingForm)
  });
}
document.addEventListener('DOMContentLoaded', function() {
  const apiSchedules = 'http://localhost:3000/api/schedules';
  let bookingForm = document.getElementById('booking-form');

  let schedulesXhr = new XMLHttpRequest();
  schedulesXhr.open('GET', apiSchedules);
  schedulesXhr.send();

  schedulesXhr.addEventListener('load', populateBookingSelectTag);
  bookingForm.addEventListener('submit', event => {
    event.preventDefault();
    bookingFormHandler(event.target);
  });
});