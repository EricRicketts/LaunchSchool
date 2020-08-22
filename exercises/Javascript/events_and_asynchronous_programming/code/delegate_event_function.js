function delegateEvent(parentElement, selector, eventType, callback, arr) {
  if (parentElement && parentElement.nodeType === Node.ELEMENT_NODE) {
    return !parentElement.addEventListener(eventType, event => {
      parentElement.setAttribute('listener', true);
      let validTargets = Array.from(parentElement.querySelectorAll(selector));
      if (validTargets.includes(event.target)) {
        callback(event, arr);
      }
    });
  }
}

export { delegateEvent };
