document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'https://ls-230-xhr-demo.herokuapp.com';
  const path = '/status/200?stream=true';
  const READY_STATE_DESCRIPTORS = [
    'UNSENT', 'OPENED', 'HEADERS_RECEIVED', 'LOADING', 'DONE'
  ];
  let startButton = document.getElementById('start');
  let resetButton = document.getElementById('reset');
  let tableBody = document.getElementById('response');

  function addListeners(xhr) {
    xhr.addEventListener('loadstart', handleEvent);
    xhr.addEventListener('progress', handleEvent);
    xhr.addEventListener('load', handleEvent);
    xhr.addEventListener('loadend', handleEvent);
  }

  function createInitialRows(xhr, event) {
    let rsValue = xhr.readyState;
    let rsDesc = READY_STATE_DESCRIPTORS[rsValue];
    let text = xhr.responseText === '' ? 'None' : xhr.responseText;
    let tr = document.createElement('tr');
    tr.innerHTML = `<td>${event.type}</td><td>0</td><td>NA</td><td>${rsDesc}</td><td>${rsValue}</td><td>${text}</td>`;
    tableBody.appendChild(tr);
  }

  function createRowData(data) {
    let td = document.createElement('td');
    let text = document.createTextNode(data);
    td.appendChild(text);
    return td;
  }

  function handleEvent(event) {
    let tr = document.createElement('tr');
    let percentDataLoaded = (event.loaded/event.total) * 100;
    let dataArray = [event.type, event.loaded];
    event.lengthComputable ? dataArray.push(percentDataLoaded) : dataArray.push('NA');
    let rsDesc = READY_STATE_DESCRIPTORS[event.currentTarget.readyState];
    let rsValue = event.currentTarget.readyState;
    let text = event.currentTarget.responseText || 'None';
    dataArray.push(rsDesc, rsValue, text);
    dataArray.forEach(data => {
      let td = createRowData(data);
      tr.appendChild(td);
    });
    tableBody.appendChild(tr);
  }

  function removeAllChildNodes(parent) {
    while (parent.hasChildNodes()) {
      parent.removeChild(parent.firstChild);
    }
  }

  startButton.addEventListener('click', event => {
    let xhr = new XMLHttpRequest();
    createInitialRows(xhr, event);
    addListeners(xhr);
    xhr.open('GET', DOMAIN + path);
    createInitialRows(xhr, event);
    xhr.send();
    createInitialRows(xhr, event);
  });

  resetButton.addEventListener('click', () => {
    removeAllChildNodes(tableBody);
  });

});