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
});