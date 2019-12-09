function firstElementOf(arr) {
    return arr[0];
}

function firstNOf(arr, number) {
    return arr.slice(0, number);
}

function lastElementOf(arr) {
    var lastIndex = arr.length - 1;
    return arr[lastIndex];
}

function lastNOf(arr, number) {
    var startIdx = arr.length - number;
    return startIdx < 0 ? arr: arr.slice(startIdx);
}

function nthElementOf(arr, index) {
    return arr[index];
}

export { firstElementOf, firstNOf, lastNOf, lastElementOf, nthElementOf };