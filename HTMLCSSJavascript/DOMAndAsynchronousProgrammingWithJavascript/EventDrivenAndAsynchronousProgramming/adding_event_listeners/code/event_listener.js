function displayText () {
  let textAreaElement = document.getElementById('message');
  let textAreaMessage = textAreaElement.value;
  let paragraphElement = document.querySelector('p');

  if (paragraphElement) {
    paragraphElement.parentNode.removeChild(paragraphElement);
  }

  paragraphElement = document.createElement('p');
  paragraphElement.textContent = textAreaMessage;
  document.body.appendChild(paragraphElement);
}

function resetText() {
  let paragraphElement = document.querySelector('p');
  paragraphElement.parentNode.removeChild(paragraphElement);
}

document.addEventListener('DOMContentLoaded', () => {
  let alertButton = document.getElementById('alert');
  let resetButton = document.getElementById('reset');
  alertButton.onclick = displayText;
  resetButton.onclick = resetText;
});