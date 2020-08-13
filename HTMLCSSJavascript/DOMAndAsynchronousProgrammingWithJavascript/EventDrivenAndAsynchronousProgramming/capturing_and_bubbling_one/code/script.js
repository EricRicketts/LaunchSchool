document.addEventListener('DOMContentLoaded', () => {
  let innerMostDivShowBorder = false;
  let innerMostDiv = document.getElementById('elem4');
  innerMostDiv.addEventListener('click', event => {
    innerMostDivShowBorder = !innerMostDivShowBorder;
    innerMostDiv.classList.toggle('update-border', innerMostDivShowBorder);
  })
});