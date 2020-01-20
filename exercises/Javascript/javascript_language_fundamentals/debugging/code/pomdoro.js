var tasks = 10;
var checkmarks = 0;
var sessions = 0;
var minutes = 0;

function pomodoro() {
  var allWork = [];
  // console.log('Work.');
  allWork.push('Work');

  while (minutes < 25) {
    minutes += 1;
    // console.log('...' + minutes);
    allWork.push('...' + minutes);
  }

  // console.log('PLING!');
  allWork.push('PLING!');

  sessions += 1;
  checkmarks += 1;

  if (checkmarks === tasks) {
    // console.log('Done!');
    allWork.push('Done!');
    // return;
    return allWork;
  }

  var rest;
  if (sessions === 4) {
    sessions = 0;
    rest = 30;
  } else {
    rest = 5;
  }

  // console.log('Rest for ' + rest + ' minutes.');
  allWork.push('Rest for ' + rest + ' minutes.');

  var minutes = 0;
  /*
  The problem is in line 41, this minutes variable shadows the global variable
  minutes and since this is a variable assignment
   */
  pomodoro();
}

export { pomodoro }