const readline = require("readline");
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Enter a number: ", function (number) {
      const num = parseInt(number);

      sum += num;
      console.log(sum);
      numsLeft--;

      addNumbers(sum, numsLeft, completionCallback);
    })
  } else {
    completionCallback(sum);
  }

}

addNumbers(0, 5, function(sum) {
  console.log(`Total Sum: ${sum}`);
  reader.close();
}) ;