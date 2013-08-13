fs = require('fs');
fs.readFile(process.argv[2], 'utf8', function (err, data) {
	if(err) {
		return console.log(err);
	}
	//console.log(data);
	var lines = data.split('\n');
	lines.forEach(function(number) {
		if( number < 0 || number > 3999) {
			console.log("Number is invalid");
		}
		if (number == 0 ) return "N";

		var values = Array(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 );
		var numerals = Array("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I");
		var results = "";
		for(var i = 0; i < 13; i++) {
			while (number >= values[i]) {
				number -= values[i];
				results += numerals[i];
			}
		}
		console.log(results);
	});
});