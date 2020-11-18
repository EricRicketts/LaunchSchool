function bookingErrorHandler(event) {
  let response = event.target.responseText;
  let sequenceNumber = response.match(/\d+/)[0];
  if (event.target.status === 404) {
    alert(`${response}`);
    registerNewStudent(event);
  } else {
    return;
  }
}
function bookingFormHandler(event) {
  const domain = 'http://localhost:3000';
  event.preventDefault();
  let path = event.target.getAttribute('action');
  let bookingFormData = new FormData(event.target);
  let bookingFormDataJson = JSON.stringify(bookingFormData);

  let bookingXhr = new XMLHttpRequest();
  bookingXhr.open('POST', domain + path);
  bookingXhr.setRequestHeader('Content-Type', 'application/json');
  bookingXhr.send(bookingFormDataJson);
  bookingXhr.addEventListener('load', bookingResponseHandler)

}
function bookingResponseHandler(event) {
  event.preventDefault();
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
function registerNewStudent(event) {

}
document.addEventListener('DOMContentLoaded', function() {
  const apiSchedules = 'http://localhost:3000/api/schedules';
  let bookingForm = document.getElementById('booking-form');

  let schedulesXhr = new XMLHttpRequest();
  schedulesXhr.open('GET', apiSchedules);
  schedulesXhr.send();

  schedulesXhr.addEventListener('load', populateBookingSelectTag)
  bookingForm.addEventListener('submit', bookingFormHandler);
});