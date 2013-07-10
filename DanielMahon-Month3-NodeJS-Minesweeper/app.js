var fs = require("fs");

var grid = {
	input: [],
	output: [],
	columns: 0,
	rows: 0
};

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line, i) {
	if (line !== '') {
		// get columns
		if (!grid.columns) grid.columns = line.length;
		// set rows
		grid.rows++;
		// set input
		grid.input[i] = line.match(/.{1}/g);
	}
});

// loop through rows
for (var y = 0; y < grid.rows; y++) {
	// loop through columns
	for (var x = 0; x < grid.columns; x++) {
		// reset mines count
		var mines = 0;
		// create empty array if none exists
		if (!grid.output[y]) grid.output[y] = [];
		// match bomb
		if (grid.input[y][x] === '*') {
			grid.output[y][x] = grid.input[y][x];
		} else {
			// check adjacent cells
			for (var x2 = -1; x2 <= 1; x2++) {
				for (var y2 = -1; y2 <= 1; y2++) {
					// skip cursor location
					if (x2 === 0 && y2 === 0) continue;
					// skip bounds
					if (y + y2 < 0) continue;
					if (x + x2 < 0) continue;
					if (y + y2 >= grid.rows) continue;
					if (x + x2 >= grid.columns) continue;
					// increment mines on hit
					if (grid.input[y + y2][x + x2] === '*') {
						mines++;
					}
				}
			}
			// add to output
			grid.output[y][x] = mines;
		}
	}
}

// log results to stdout
grid.output.forEach(function(line) {
	console.log(line.join(' '));
});