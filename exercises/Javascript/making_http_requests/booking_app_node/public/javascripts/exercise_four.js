function addANewScheduleFieldSet() {
  const allScheduleFieldSets = document.getElementsByClassName('fieldset-data');
  const numberOfScheduleFieldSets = allScheduleFieldSets.length;
  const lastScheduleFieldSet = allScheduleFieldSets[numberOfScheduleFieldSets - 1];
  const fieldSetLegendText = lastScheduleFieldSet.querySelector('legend').innerText;
  const newFieldSetNumber = Number(fieldSetLegendText.match(/\d+/)[0]) + 1;

  let fieldSetClone = lastScheduleFieldSet.cloneNode(true);
  updateClonedFieldSet(fieldSetClone, newFieldSetNumber);
  lastScheduleFieldSet.insertAdjacentElement('afterend', fieldSetClone);
}
function configureFormData(form, serverData) {
  let formData = new FormData(form);
  let arrayedData = Array.from(formData.entries()).reduce((arr, [name, value]) => {
    if (name === 'staff_id') {
      let subArray = [[name, Number(value)]];
      arr.push(subArray);
    } else {
      let lastIndex = arr.length - 1;
      arr[lastIndex].push([name, value]);
    }
    return arr;
  }, []);
  arrayedData.forEach(subArray => {
    let obj = {};
    subArray.forEach(([name, value]) => {
      obj[name] = value;
    });
    serverData.schedules.push(obj);
  });
}
function formatServerStaffData(event) {
  let allStaffData = event.target.response;
  return allStaffData.reduce((staffNamesAndIds, staffData) => {
    staffNamesAndIds[staffData.name] = staffData.id;
    return staffNamesAndIds;
  }, {});
}
function mapServerStaffDataToStaffNameSelectElement(event) {
  let allStaffNamesAndIds = formatServerStaffData(event);
  populateSelectElementWith(allStaffNamesAndIds);
}
function populateSelectElementWith(allStaffNamesAndIds) {
  let initialSelectTag = document.getElementsByClassName('staff-name-select')[0];
  Object.entries(allStaffNamesAndIds).forEach(([staffName, staffId]) => {
    let option = document.createElement('option');
    let text = document.createTextNode(staffName);
    option.setAttribute('value', staffId);
    option.appendChild(text);
    initialSelectTag.appendChild(option);
  });
}
function populateStaffNameSelectElement() {
  let allStaffNames;
  const allStaff = 'http://localhost:3000/api/staff_members';

  let allStaffXhr = new XMLHttpRequest();
  allStaffXhr.open('GET', allStaff);
  allStaffXhr.responseType = 'json'
  allStaffXhr.send();

  allStaffXhr.addEventListener('load', mapServerStaffDataToStaffNameSelectElement);
}
function scheduleHandler(event) {
  const domain = 'http://localhost:3000';
  let form = document.querySelector('form');
  let path = form.getAttribute('action');
  let data = { schedules: [] };
  event.preventDefault();

  configureFormData(form, data);
  let xhr = new XMLHttpRequest();
  xhr.open('POST', domain + path);
  xhr.setRequestHeader('Content-Type', 'application/json');
  let jsonData = JSON.stringify(data);
  xhr.send(jsonData);

  xhr.addEventListener('loadend', serverHandler);
}
function serverHandler(event) {
  alert(`${event.target.responseText}`);
}
function updateClonedFieldSet(fieldSetClone, newFieldSetNumber) {
  const fieldSetClasses = ['staff-name-input', 'date-inputs', 'time-inputs'];
  fieldSetClone.querySelector('legend').innerText = `Schedule ${newFieldSetNumber}`;

  fieldSetClasses.forEach(className => {
    let classChildren = fieldSetClone.getElementsByClassName(className)[0].children;
    switch(className) {
      case 'staff-name-input': {
       classChildren[0].setAttribute('for', `staff-name-${newFieldSetNumber}`);
       classChildren[1].setAttribute('id', `staff-name-${newFieldSetNumber}`);
       break;
      }
      case 'date-inputs': {
        classChildren[0].setAttribute('for', `date-${newFieldSetNumber}`);
        classChildren[1].setAttribute('id', `date-${newFieldSetNumber}`);
        break;
      }
      case 'time-inputs': {
        classChildren[0].setAttribute('for', `time-${newFieldSetNumber}`);
        classChildren[1].setAttribute('id', `time-${newFieldSetNumber}`);
        break;
      }
    }
  });
}
document.addEventListener('DOMContentLoaded', function() {
  const domain = 'http://localhost:3000';
  populateStaffNameSelectElement();
  const addMoreSchedulesButton = document.getElementById('add-schedule');
  addMoreSchedulesButton.addEventListener('click', addANewScheduleFieldSet);
  document.addEventListener('submit', scheduleHandler);
});