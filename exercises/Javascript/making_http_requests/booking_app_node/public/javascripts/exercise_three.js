document.addEventListener('DOMContentLoaded', () => {
  let submitButton = document.getElementById('submit-button');
  let emailInput = document.getElementById('email');
  let nameInput = document.getElementById('name');
  submitButton.addEventListener('click', () => {
    let request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:3000/api/staff_members');
    request.setRequestHeader('Content-Type', 'application/json');
    let staffData = { email: emailInput.value, name: nameInput.value }
    let jsonStaffData = JSON.stringify(staffData);
    emailInput.value = '';
    nameInput.value = '';
    request.send(jsonStaffData);
    request.addEventListener('load', event => {
      let status = Number.parseInt(event.target.status, 10);
      if (status >= 400 && status < 500) {
        Swal.fire({
          icon: 'error',
          title: 'Incorrect Input',
          text: `{event.target.responseText}`
        });
      }
    });
  })
});