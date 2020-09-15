document.addEventListener('DOMContentLoaded', () => {
  const DOMAIN = 'https://ls-230-xhr-demo.herokuapp.com';
  const path = '/status/200?stream=true';
  let startButton = document.getElementById('start');
  let resetButton = document.getElementById('reset');
  let tableBody = document.getElementById('response');

  function addListeners(xhr) {
    xhr.addEventListener('loadstart', handleEvent);
    xhr.addEventListener('progress', handleEvent);
    xhr.addEventListener('load', handleEvent);
    xhr.addEventListener('loadend', handleEvent);
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

  startButton.addEventListener('click', () => {
    let xhr = new XMLHttpRequest();
    addListeners(xhr);
    xhr.open('GET', DOMAIN + path);
    xhr.send();
  });

  resetButton.addEventListener('click', () => {
    removeAllChildNodes(tableBody);
  });

});