var fs = require("fs");

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line, i) {
	if (line !== '') {
		createGrid(line);
	}
});

function createGrid(line) {
	// init data
	var data = {
		input: [],
		output: [],
		columns: 0,
		rows: 0
	};
	// get parts
	var array = line.split(';')[1];
	var size = line.split(';')[0].split(',');
	// set columns
	data.columns = size[1];
	// set rows
	data.rows = size[0];
	// convert list to array
	array = array.match(/.{1}/g);
	// convert to array of arrays
	for (var i = 0; i < data.rows; i++) {
		data.input[i] = array.slice(i * data.columns, (i + 1) * data.columns);
	}
	// loop through rows
	for (var y = 0; y < data.rows; y++) {
		// loop through columns
		for (var x = 0; x < data.columns; x++) {
			// reset mines count
			var mines = 0;
			// create empty array if none exists
			if (!data.output[y]) data.output[y] = [];
			// match bomb
			if (data.input[y][x] === '*') {
				data.output[y][x] = data.input[y][x];
			} else {
				// check adjacent cells
				for (var x2 = -1; x2 <= 1; x2++) {
					for (var y2 = -1; y2 <= 1; y2++) {
						// skip cursor location
						if (x2 === 0 && y2 === 0) continue;
						// skip bounds
						if (y + y2 < 0) continue;
						if (x + x2 < 0) continue;
						if (y + y2 >= data.rows) continue;
						if (x + x2 >= data.columns) continue;
						// increment mines on hit
						if (data.input[y + y2][x + x2] === '*') {
							mines++;
						}
					}
				}
				// add to output
				data.output[y][x] = mines;
			}
		}
	}
	var stdout = '';
	// convert back to single array
	for (y = 0; y < data.rows; y++) {
		// loop through columns
		for (x = 0; x < data.columns; x++) {
			stdout += data.output[y][x];
		}
	}
	// log results to stdout
	console.log(stdout);
}
