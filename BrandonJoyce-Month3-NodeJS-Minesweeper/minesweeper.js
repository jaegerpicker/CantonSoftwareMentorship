function Minesweeper() {
    this.parse = function(input) {
        var rows = [];
        var rowLength = input.split(',', 1);
        var columnLength =input.split(',')[1].split(";", 1);
        var matrixInput = input.split(';')[1];
        var characterPosition = 0;
        for (var i = 0; i < rowLength; i++) {
            var row = [];
            for (var c = 0; c < columnLength; c++) {
                row.push(matrixInput.substr(characterPosition, 1));
                characterPosition++;
            }
            rows.push(row);
        }
        return rows;
    }

    this.solve = function(grid) {
        var result = "";
        for(var r = 0; r < grid.length; r++){
            for(var c = 0; c < grid[r].length; c++) {
                if (grid[r][c] !== "*"){
                    var mineCount = 0;
                    mineCount += this.sweepCell(grid, r-1, c-1);
                    mineCount += this.sweepCell(grid, r-1, c);
                    mineCount += this.sweepCell(grid, r-1, c+1);
                    mineCount += this.sweepCell(grid, r, c+1);
                    mineCount += this.sweepCell(grid, r, c-1);
                    mineCount += this.sweepCell(grid, r+1, c-1);
                    mineCount += this.sweepCell(grid, r+1, c);
                    mineCount += this.sweepCell(grid, r+1, c+1);
                    result += mineCount.toString();
                }
                else{
                    result += "*";
                }
            }
        }
        return result;
    }

    this.sweepCell = function(grid, row, column) {
        if (row < 0)
            return 0;
        if (column < 0)
            return 0;
        if (row + 1 > grid.length)
            return 0;
        if (column + 1 > grid[0].length)
            return 0;
        if (grid[row][column] === "*")
            return 1;
        else
            return 0;
    }
}

module.exports = new Minesweeper();