const tracker = (() => {
  const events = [];

  return {
    add(event) {
      events.push(event);
    },
    clear() {
      events.length = 0;
      return events.length;
    },
    elements() {
      return this.list().map(({target}) => target);
    },
    list() {
      return events.slice();
    }
  }
})();

function track(callback) {
  function isEventTracked(events, event) {
    return events.includes(event);
  }

  return event => {
    if (!isEventTracked(tracker.list(), event)) {
      tracker.add(event);
    }

    callback(event);
  };
}

export { track, tracker };