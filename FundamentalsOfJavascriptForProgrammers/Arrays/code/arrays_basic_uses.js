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

function nthElementOf(arr, index) {
    return arr[index];
}

export { firstElementOf, firstNOf, lastElementOf, nthElementOf };