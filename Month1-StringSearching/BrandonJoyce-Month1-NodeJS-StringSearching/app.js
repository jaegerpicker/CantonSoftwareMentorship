var stringSearch = require("./stringSearch.js");
var fs = require("fs");

fs.createReadStream("./test-input.txt", {encoding:'utf8'}).on("data", function(data){
    var lines = data.split("\n");
    for (i=0; i<lines.length; i++){
        var params = lines[i].split(",", 2);
        console.log(stringSearch.search(params[0], params[1]));
    }
});