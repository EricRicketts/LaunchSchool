var totalPages = 364;
var energy = 100;
var progress = [];

var totalPagesFix = 364;
var energyFix = 100;
var currentPageFix = 1;
var progressFix = [];

function read() {
  var currentPage = 1;

  while (energy > 0 && currentPage < totalPages) {
    currentPage += 1;
    energy -= (5 + currentPage * 0.1);
  }

  // console.log('Made it to page ' + String(currentPage) + '.');
  progress.push('Made it to page ' + String(currentPage) + '.');

  // Drink a cup of coffee.
  energy = 100;

  // Continue reading.
  if (currentPage < totalPages) {
    read();
  } else {
    // console.log('Done!');
    progress.push('Done!');
  }
}

function readFix() {

  while (energyFix > 0 && currentPageFix < totalPagesFix) {
    currentPageFix += 1;
    energyFix -= (5 + currentPageFix * 0.1);
  }

  // console.log('Made it to page ' + String(currentPage) + '.');
  progressFix.push('Made it to page ' + String(currentPageFix) + '.');

  // Drink a cup of coffee.
  energyFix = 100;

  // Continue reading.
  if (currentPageFix < totalPagesFix) {
    readFix();
  } else {
    // console.log('Done!');
    progressFix.push('Done!');
  }
}

export { read, readFix, progressFix };