let App = {
  startAndUpdateTimer: function(t) {
    let stopwatch = setInterval(() => {
      t = t + 1;
    }, 10);
  },
  init: function(document) {
    this.document = document;
    this.hours = this.document.querySelector('#hours.digits');
    this.minutes = this.document.querySelector('#minutes.digits');
    this.seconds = this.document.querySelector('#seconds.digits');
    this.centiseconds = this.document.querySelector('#centiseconds.digits');
    this.control = this.document.getElementById('control');
    this.reset = this.document.getElementById('reset');
  }
}
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});
/*
1.  Functionality
    i.    Hit Start and the timer starts
    ii.   the centiseconds count to 100 and then go back to zero
    iii.  once the centiseconds hit 100 then seconds start
    iv.   For seconds and minutes once they hit 60 the higher time measurement trips
    v.    Hours go from 0 to 100.
    vi.   Hit the start button time begins
    vii.  Hit the stop button the time pauses
    viii. Hit the start button again the time resumes.
    ix.   Hit the reset button everything is reset to zero.
2.  Algorithm
    We need some kind of timer function
    1.  the lowest level timer needs to update to the screen every 10 milliseconds
    2.  when the lowest level timer passes 1000 milliseconds the seconds counter updates
    3.  when the lowest level timer passes 60 000 milliseconds the minutes counter updates
    4.  when the lowest level timer passes 60 000 000 milliseconds the hours counter updates
    5.  when the lowest level timer hits the 360 000 000 milliseconds the entire system resets

    We can set the timer interval to 360 000 000 so that when it hits 360 000 000 milliseconds
    everything resets.

    call the variable to track the time centiseconds, the setInterval timer itself needs to be
    set to 10, which is 10 milliseconds, every time this interval triggers update the centiseconds
    field in the html.

    when centiseconds % 100 then update seconds and reset the centiseconds to 00

    when centiseconds % 6000 then update the minutes and set seconds to 00

    when centiseconds % 6 000 000 then update the hours and set the minutes to 00

    when centiseconds % 36 000 000 then reset all to 00
*/