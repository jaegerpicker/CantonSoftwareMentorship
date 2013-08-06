var fs = require("fs");
var minesweeper = require("./minesweeper.js");

var file = fs.readFileSync("./testinput.txt", 'utf-8');
var lines = file.split("\n");
lines.forEach(function(line){
    var grid = minesweeper.parse(line);
    console.log(minesweeper.solve(grid));
});
