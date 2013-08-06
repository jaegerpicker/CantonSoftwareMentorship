var assert = require("assert");
var minesweeper = require("./minesweeper.js");

//creates a two-dimensional array
var input = "3,5;**.........*...";
var result = minesweeper.parse(input);
assert.equal(3, result.length);
assert.equal(5, result[0].length);

//cells contain mines
assert.equal("*", result[0][0]);
//cells contain dots
assert.equal(".", result[0][3]);

//solves the challenge for one matrix
var solution = minesweeper.solve(result);
assert.equal("**100332001*100", solution);
