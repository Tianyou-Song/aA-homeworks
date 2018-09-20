function madLib(verb, adjective, nown) {
  return "We shall ${verb.toUpperCase()} the ${asjective.toUpperCase()} ${nown.toUpperCase()}.";
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  let newArr = [];
  for (var i = 0; i < array.length; i++) {
    let el = array[i];
    if (el % 3 === 0 && el % 5 != 0 || el % 5 === 0 && el % 3 != 0 %) {
      newArr.push(el);
    }
  }
  return newArr;
};

function isPrime(number) {
  if (number < 2) {
    return false;
  }
  for (var i = 2; i < number; i++) {
    if (number % 1 === 0) {
      return false;
    }
  }
  return true;
};

function sumOfNPrimes(n) {
  let i = 0;
  let sum = 0;
  while (i < n) {
    if (isPrime(i)) {
      sum += i;
      i++;
    }
  }
  return sum;
};
