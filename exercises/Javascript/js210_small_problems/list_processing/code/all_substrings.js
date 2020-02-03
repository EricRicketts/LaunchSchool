import { substringsAtStartAlternate } from "./leading_substrings";

function substrings(str) {
  let slicedStrs = [...Array(str.length).keys()].map((idx) => str.slice(idx) );

  return slicedStrs.map((substr) => substringsAtStartAlternate(substr) ).flat();
}

function substringsLaunchSchool(str) {
  return str.split('').map(function(char, idx) {
    return substringsAtStartAlternate(str.substring(idx));
  }).reduce(function(result, array) {
    return result.concat(array);
  })
}

export { substrings, substringsLaunchSchool };