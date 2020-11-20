function createDateBookings(dateData, ul) {
  let li = document.createElement('li');
  let str = `${dateData.staff_name} | ${dateData.student_email} | ${dateData.time}`;
  let text = document.createTextNode(str);
  li.appendChild(text);
  ul.appendChild(li);
}
function createDatesAndBookings(date, dateDataArray, topLevelUl) {
  let dateText = document.createTextNode(date);
  let topLevelLi = document.createElement('li');
  let span = document.createElement('span');

  span.appendChild(dateText);
  span.classList.add('date');
  topLevelLi.appendChild(span);
  topLevelUl.appendChild(topLevelLi);

  let secondLevelUl = document.createElement('ul');
  secondLevelUl.classList.add('second-level');
  dateDataArray.forEach(dateData => {
    createDateBookings(dateData, secondLevelUl);
  });
  topLevelLi.appendChild(secondLevelUl);
}
function toggleDateBookings(element) {
  element.addEventListener('click', event => {
    let hiddenUl = event.target.nextElementSibling;
    let cssHiddenUl = window.getComputedStyle(hiddenUl, null);
    if (hiddenUl.style.display === 'none' || cssHiddenUl.display === 'none') {
      hiddenUl.style.display = 'flex';
    } else {
      hiddenUl.style.display = 'none';
    }
  });
}
document.addEventListener('DOMContentLoaded', function() {
  const domain = 'http://localhost:3000';
  const schedulesApi = '/api/schedules';
  const staffApi = '/api/staff_members';
  let topLevelUl = document.querySelector('ul.top-level');

  let schedulesXhr = new XMLHttpRequest();
  schedulesXhr.open('GET', domain + schedulesApi);
  schedulesXhr.send();

  schedulesXhr.addEventListener('load', schedulesEvent => {
    let allStaffXhr = new XMLHttpRequest();
    allStaffXhr.open('GET', domain + staffApi);
    allStaffXhr.send();

    allStaffXhr.addEventListener('load', allStaffEvent => {
      let schedulesData = JSON.parse(schedulesEvent.target.response);
      let allStaffData = JSON.parse(allStaffEvent.target.response);

      let filteredSchedulesData = schedulesData.filter(schedule => schedule.student_email !== null);
      let bookingDateData = filteredSchedulesData.reduce((bookingObject,schedule) => {
        if (!Object.keys(bookingObject).includes(schedule.date)) { bookingObject[schedule.date] = []; }
        let bookingData = {};
        bookingData.staff_name = allStaffData.find(staffMember => staffMember.id === schedule.staff_id).name;
        bookingData.student_email = schedule.student_email;
        bookingData.time = schedule.time;
        bookingObject[schedule.date].push(bookingData);
        return bookingObject;
      }, {});

      Object.entries(bookingDateData).forEach(([date, dateDataArray]) => {
        createDatesAndBookings(date, dateDataArray, topLevelUl);
      });

      Array.from(document.getElementsByClassName('date')).forEach(element => {
        toggleDateBookings(element);
      });
    });
  });

});