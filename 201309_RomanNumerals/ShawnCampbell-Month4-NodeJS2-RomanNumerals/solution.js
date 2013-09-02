var     lazy    = require("lazy"),
        fs  = require("fs");
var values = Array(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 );
var numerals = Array("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I");
 new lazy(fs.createReadStream(process.argv[2]))
     .lines
     .forEach(function(line){
        var results = "";
        number = line;
		for(var i = 0; i < 13; i++) {
			while (number >= values[i]) {
				number -= values[i];
				results += numerals[i];
			}
		}
		console.log(results);
     }
 );