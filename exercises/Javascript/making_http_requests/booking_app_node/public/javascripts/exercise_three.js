function stringifyFormData(formData) {
  let object = {};
  Array.from(formData.entries()).forEach(([key, value]) => object[key] = value);
  return JSON.stringify(object);
}

document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  document.addEventListener('submit', event => {
    event.preventDefault();
    let formData = new FormData(form);
    let jsonFormData = stringifyFormData(formData);

    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://localhost:3000/api/staff_members');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(jsonFormData);

    xhr.addEventListener('load', event => {
      let responseXhr = event.target;
      switch (responseXhr.status) {
        case 201: {
          let data = JSON.parse(responseXhr.response);
          alert(`Successfully add a new staff member with an id of ${data.id}`)
          form.reset();
          break;
        }
        case 400: {
          alert(`${responseXhr.responseText}`);
          break;
        }
      }
    });
  });
});