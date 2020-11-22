document.addEventListener('DOMContentLoaded', function() {
  const schedulesAPI = 'http://localhost:3000/api/schedules';
  const bookingsAPI = 'http://localhost:3000/api/bookings';
  let schedulesForm = document.getElementById('cancel-schedule');
  let bookingsForm = document.getElementById('cancel-booking');

  schedulesForm.addEventListener('submit', event => {
    event.preventDefault();
    let schedule_id = document.querySelector('input[name="schedule_id"]').value;

    let schedulesXhr = new XMLHttpRequest();
    schedulesXhr.open('DELETE', `${schedulesAPI}/${schedule_id}`);
    schedulesXhr.send();

    schedulesXhr.addEventListener('load', event => {
      let statusCode = event.target.status;
      let responseMessage = event.target.responseText;

      if (statusCode === 403 || statusCode === 404) {
        alert(`${responseMessage}`);
      } else if (statusCode === 204) {
        alert(`Schedule with id ${schedule_id} successfully deleted.`);
      } else {
        return;
      }
    });
  });

  bookingsForm.addEventListener('submit', event => {
    event.preventDefault();
    let booking_id = document.querySelector('input[name="booking_id"]').value;

    let bookingsXhr = new XMLHttpRequest();
    bookingsXhr.open('PUT', `${bookingsAPI}/${booking_id}`);
    bookingsXhr.send();

    bookingsXhr.addEventListener('load', event => {
      let statusCode = event.target.status;
      let responseMessage = event.target.responseText;

      if (statusCode === 404) {
        alert(`${responseMessage}`);
      } else if (statusCode === 204) {
        alert(`Booking with id ${booking_id} successfully cancelled.`);
      } else {
        return;
      }
    });
  });
});