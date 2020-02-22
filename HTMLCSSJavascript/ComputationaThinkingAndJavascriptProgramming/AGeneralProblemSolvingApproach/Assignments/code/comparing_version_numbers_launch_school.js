function compareVersions(versionA, versionB) {
  let validChars = /^[0-9]+(\.[0-9]+)*$/;
  let aParts;
  let bParts;
  let aValue;
  let bValue;
  let maxLength;

  if(!validChars.test(versionA) || !validChars.test(versionB)) {
    return null;
  }

  aParts = versionA.split('.').map(Number);
  bParts = versionB.split('.').map(Number);
  maxLength = Math.max(aParts.length, bParts.length);

  for (let i = 0; i < maxLength; i += 1) {
    aValue = aParts[i] || 0;
    bValue = bParts[i] || 0;

    if (aValue > bValue) {
      return 1;
    } else if (aValue < bValue) {
      return -1;
    }
  }

  return 0;
}

export { compareVersions };

/*
I decided to include the Launch School version and test it as I was really impressed
with the code implementation compared to my version.  We had the same approach to the
problem, basically:
1.  First check for valid inputs
2.  Second split the strings for each version and then compare version number parts
by converting the string parts into numbers.

The Launch School check for valid inputs was much cleaner as it made better use
of regular expressions than I did.  This considerably shortened the code.

In terms of the actual comparisons I took the step of padding the smaller
of the two numbers with 0's, Launch School usd a much better technique, during the
loop for comparing the version number parts they simply checked if the part existed,
if it did not exist they used a 0 for comparison.  This resulted in a lot less code.
 */