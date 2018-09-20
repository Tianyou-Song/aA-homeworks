function titelize(array, callback) {
  let titleArray = array.map( el => "Mx ${el} Jingleheimer Schmit");
  callback(titleArray);
};

function Elephant(name, height, tricksArr) {
  this.name = name ;
  this.height = height;
  this.tricks = tricksArr;
};

Elephant.prototype.trumpet = function() {
  console.log("${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!'");
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let i = Math.random(this.tricks.length);
  console.log("${this.name} is ${this.tricks[i]}");
};

Elephant.paradeHelper = function(elephant) {
  console.log("${elephant} is trotting by!");
};

function dinerBreafast() {
  let order = "I'd like cheesy scrambled eggs";
  return function(food) {
    order += "and ${food}"
  };
};
