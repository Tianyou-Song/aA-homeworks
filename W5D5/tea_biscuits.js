const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stout,
  });

teaAndBiscuits () {
    reader.question(
        "Would you like tea?",
        function(input){console.log(input)};
        reader.question(
            "Would you like biscuits?",
            function(input2){console.log(input2)};

            console.log(`You said ${input} to tea and ${input2} to biscuits.`);
        );
    );
};
