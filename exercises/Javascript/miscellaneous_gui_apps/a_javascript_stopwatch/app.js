let App = {
  displayTime: function() {
    this.centisecondsSpan.textContent = ('0' + this.centiSecs).slice(-2);
    this.secondsSpan.textContent = ('0' + this.seconds).slice(-2);
    this.minutesSpan.textContent = ('0' + this.minutes).slice(-2);
    this.hoursSpan.textContent = ('0' + this.hours).slice(-2);
  },
  resetTimer: function() {
    [this.hoursSpan, this.minutesSpan, this.secondsSpan, this.centisecondsSpan].forEach(span => {
      span.textContent = '00';
    });
    this.centiSecs = 0;
    this.seconds = 0;
    this.minutes = 0;
    this.hours = 0;
  },
  resetStopwatch: function(event) {
    clearInterval(this.stopwatch);
    this.on = false;
    this.control.textContent = 'Start';
    this.resetTimer();
  },
  runStopwatch: function() {
    this.centiSecs += 1;
    if (this.centiSecs === 100) {
      this.centiSecs = 0;
      this.seconds += 1;

      if (this.seconds === 60) {
        this.seconds = 0;
        this.minutes += 1;

        if (this.minutes === 60) {
          this.minutes = 0;
          this.hours += 1;

          if (this.hours === 100) {
            this.hours = 0;
          }
        }
      }
    }
    this.displayTime();
  },
  startStop: function(event) {
    if (this.on) {
      this.control.textContent = 'Start';
      this.on = false;
      clearInterval(this.stopwatch);
    } else {
      this.control.textContent = 'Stop';
      this.on = true;
      this.stopwatch = setInterval(() => this.runStopwatch(), 10);
    }
  },
  init: function(document) {
    this.document = document;
    this.hoursSpan = this.document.querySelector('#hours > .digits');
    this.minutesSpan = this.document.querySelector('#minutes > .digits');
    this.secondsSpan = this.document.querySelector('#seconds > .digits');
    this.centisecondsSpan = this.document.querySelector('#centiseconds > .digits');
    this.control = this.document.getElementById('control');
    this.control.textContent = 'Start';
    this.reset = this.document.getElementById('reset');
    this.centiSecs = 0;
    this.seconds = 0;
    this.minutes = 0;
    this.hours = 0;
    this.on = false;
    this.control.addEventListener('click', event => this.startStop(event));
    this.reset.addEventListener('click', event => this.resetStopwatch(event));
  }
}
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});
