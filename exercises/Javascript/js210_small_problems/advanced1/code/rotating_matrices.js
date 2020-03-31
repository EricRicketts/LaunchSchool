import { transpose } from "./transpose_mxn";

function rotate90(arr) {
  return transpose(arr).map((row) => row.reverse());
}

export { rotate90 };