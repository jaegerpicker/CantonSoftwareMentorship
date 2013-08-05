var minesweeper = new (function(){
	var ths = this;

	ths.process = function(input, callback) {
		var boardsIn = parse(input);
		var boardsOut = [];

		for(var i = 0; i < boardsIn.length; i++) {
			if(validate(boardsIn[i]))
				boardsOut.push(convert(boardsIn[i]));
			else
				boardsOut.push({ height:0, width:0, value:'This board was improperly formed.' });
		}

		callback(boardsOut);
	}

	function parse(input) {
		var lines = input.split('\n');
		var boards = [];

		for(var i = 0; i < lines.length; i++) {
			var line = lines[i].split(/\;|\,/g);
			if(line.length > 2) {
				boards.push({
					height: parseInt(line[0]),
					width:parseInt(line[1]),
					value: line[2]
				});
			} else {
				boards.push({error: true});
			}
		}

		return boards;
	}

	function validate(board) {
		var valid = true;

		valid = valid && !board.error; 											//error flag is set if there was a parsing error
		valid = valid && (board.height * board.width) === board.value.length;	//correct number of characters in board - this will also detect height and width problems
		valid = valid && board.value.search(/[^\.\*]/) == -1;					//value only contains . and *

		return valid;
	}

	function convert(board) {
		board.value = board.value.replace(/\./g, '0').split('');

		for(var i = 0; i < board.value.length; i++){
			if(board.value[i] === '*') {
				setBomb(i, board);
			}
		}

		board.value = board.value.join('');
		return board;
	}

	function setBomb(bombIndex, board) {
		var increment = function(offset) { 
			var pos = board.value[bombIndex + offset];
			if(typeof(pos) !== 'undefined' && pos !== '*') { 
				board.value[bombIndex + offset]++;
			} 
		};

		if(bombIndex % board.width != 0) {
			increment(-board.width - 1);	//┌
			increment(-1);					//←
			increment(board.width - 1);		//└
		}
		
		increment(-board.width);		//↑
		increment(board.width);			//↓

		if((bombIndex + 1) % board.width != 0) {
			increment(-board.width + 1);	//┐
			increment(1);					//→
			increment(board.width + 1);		//┘
		}
	}
})();