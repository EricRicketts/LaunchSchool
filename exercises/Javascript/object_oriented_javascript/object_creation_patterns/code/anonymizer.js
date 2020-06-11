'use strict';

const Anonymizer = (function() {
  const randomCharacter = () => Math.floor(Math.random() * 36).toString(36);
  /*
    Very clever.  So how does this work, well toString() can take an optional radix number from 2 to 36.  Obviously,
    if we take 16 as the radix, we can get 0..9 and a..f, with a radix 36 we get 0..9 and a..z.  excellent
  */
  const anonymize = () => '0'.repeat(16).replace(/./g, randomCharacter);
  /*
    Another excellent solution, my anonymize function was much longer.  In this case you have a string of 17 '0's
    and then progress down the string character by character => /./g as this is a global replacement for a single
    character and then insert a random character.  Obviously, the argument for the randomCharacter function is the
    regex match.
  */

  function isValidPassword(attempt) {
    return this.user.password === attempt;
  }

  function withValidPassword(pass, validPasswordDo) {
    return isValidPassword.call(this, pass) ? validPasswordDo() : 'Invalid password';
  }

  /*
    In my solution I had to repeat a lot of code for checking the the presence of valid or invalid password and then
    responding accordingly.  This is an excellent solution to DRYing up the code I wrote.  Much like in Ruby with the
    concept of blocks and delayed execution.
  */

  return Object.freeze({
    init(email, password, firstName, lastName) {
      this.user = { email, password, firstName, lastName };
      this.displayName = anonymize();
      return this;
    },

    reanonymize(password) {
      return withValidPassword.call(this,  password, () => {
        this.displayName = anonymize();
        return true;
      });
    },

    resetPassword(currentPassword, newPassword) {
      return withValidPassword.call(this, currentPassword, () => {
        this.user.password = newPassword;
        return true;
      });
    },

    firstName(password) {
      return withValidPassword.call(this, password, () => this.user.firstName);
    },

    lastName(password) {
      return withValidPassword.call(this, password, () => this.user.lastName);
    },

    email(password) {
      return withValidPassword.call(this, password, () => this.user.email);
    }
  });
})();

let Account = (function() {
  const delegate = (context, methodName) => {
    return (...args) => context[methodName].apply(context, args);
  }
  /*
    An ES6 version of the delegate method, context is the object passed in, methodName is self-explanatory.  A function
    is returned which accommodates any required arguments.  Note with the context provided we can always correctly
    call the method because it is called in the context of our desired object.
  */

  return {
    init(email, password, firstName, lastName) {
      let anonUser = Object.create(Anonymizer).init(email, password, firstName, lastName);

      Object.defineProperty(this, 'displayName', {
        get: () => anonUser.displayName,
      });

      this.reanonymize = delegate(anonUser, 'reanonymize');
      this.resetPassword = delegate(anonUser, 'resetPassword');
      this.email = delegate(anonUser, 'email');
      this.firstName = delegate(anonUser, 'firstName');
      this.lastName = delegate(anonUser, 'lastName');
      return this;
    }
  };
})();

export { Account };
/*
  The IIFE above is really a good piece of programming.  So one thing I did not know in creating an object in
  Javascript if you just use the method name then Javascript automatically creates a property whose name is the name of
  the function and whose value is the function.  Note all of the functions listed are those stated in the problem
  requirements.  All calls to withValidPassword are using call with the value of "this" provided, thereby enabling
  the code to adjust to any object created.  Not the return value of this IIFE is an object which has closure over
  two other functions.

  Another IIFE was created which called the Anonymizer in the return object and which created a closure around the
  delegate function.  Interestingly, an anonymous user (anonUser) was created using Object.create and passing in the
  Anonymizer object.  init was called to initialize all of the required properties in addition Object create puts all
  of the methods on the anonUser variable in addition to all of the properties.  A new property was defined the
  displayName property which is a getter for the displayName property.  The last code block provides the functional
  values for the required functions of the problem description.  Note the actual values for email, password, firstName,
  and lastName are contained in the anonUser.  Returning an object in lines 77 through 91 is what the user will
  actually use when creating objects to work with.
*/
/*
  This solution was actually copied and slightly modified from one of the student solutions.  It is one of the most
  succinct and clever Javascript solutions I have ever read.  I have coded up my own version of it and added comments
  because I had to walk through some of the code rather carefully to understand it.


*/