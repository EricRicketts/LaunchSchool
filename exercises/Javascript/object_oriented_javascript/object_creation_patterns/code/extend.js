function delegate(callingObject, methodOwner, methodName) {
  return function() {
    return methodOwner[methodName].apply(callingObject, arguments);
  }
}
function extend(target, source) {
  let methodNames = Object.keys(source);
  methodNames.forEach((methodName) => {
    target[methodName] = delegate(target, source, methodName);
  });

  return target;
}
let professional = {
  invoice: function () {
    return `${this.fullName()} is Billing customer`;
  },
  payTax: function() {
    return `${this.fullName()} Paying taxes`;
  }
}

export { extend, professional };
/*
  I had to look at the answer, but that is still OK, I learned something.  First of all I got a bit confused about
  the professional object.  I thought originally it was just a plain object and then went onto to make it an instance
  of Professional, finally when I looked at the solution, I saw that my original assumption was correct, it was just
  a plain object.

  So, ultimately we want the methods from the source object to be adopted by the target object.  Note in the example, it
  was not the prototype of doctor and professor that got modified but the resulting objects themselves, doctor and
  professor.  So, Object.keys(source) will return an array of enumerable "own" property keys for the object, which is
  exactly what we want in this case.  Our desire is for the doctor and professor objects to be able to use the
  two methods owned by professional: invoice and payTax.  So the first thing is to get all of the keys we want to add
  to doctor and professor.

  Then we iterate through the keys and set the value of the desired key for the target object (doctor and professor)
  to the value returned from the delegate function.  This is important because the delegate function returns a function.
  The key point to examine is what function is returned?  Well, because the delegate function returns a closure over
  the source object, we always have a reference to the source object.  Additionally, the source method is called but
  at execution it is given the target object for the value of "this".

  All of these statements are very important.  Our intent is to call professional.invoice and professional.payTax,
  in such a way that if the invoice and payTax methods change, we automatically call the updates when doctor and
  professor invoke those methods.  The only way to do this is for delegate to return a function which uses professional
  to call invoice and payTax BUT uses the current object (doctor and professor) for the value of "this".

*/