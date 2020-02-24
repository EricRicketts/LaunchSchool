function cleanUpPhoneNumber(phoneNumber) {
  const BAD_NUMBER = '0000000000';
  const LAST_TEN = -10;
  const NON_NUMERIC_REGEX = /\D+/g;
  let numericOnlyPhoneNumber = phoneNumber.replace(NON_NUMERIC_REGEX, '');

  return isValidPhoneNumber(numericOnlyPhoneNumber) ? numericOnlyPhoneNumber.slice(LAST_TEN) : BAD_NUMBER;
}

function isValidPhoneNumber(phoneNumber) {
  return phoneNumber.length === 10 || (phoneNumber.length === 11 && phoneNumber[0] === '1');
}

export { cleanUpPhoneNumber };