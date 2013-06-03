var assert = require("assert");
var stringSearch = require("./stringSearch.js");

describe("StringSearch", function(){
    describe("#search(parent, pattern)", function(){
        it("returns true when the pattern is a substring of the parent", function(done){
            var parent = "Hello";
            var pattern = "ell";
            var result = stringSearch.search(parent, pattern);
            assert(result);
            done();
        });
        it("returns false when the pattern is not a substring of the parent", function(done){
            var parent = "Hello";
            var pattern = "Boom";
            var result = stringSearch.search(parent, pattern);
            assert(!result);
            done();
        });
        it("allows asterisks to be used to match one or more characters", function(done){
            var parent = "CodeEval";
            var pattern = "C*Eval";
            var result = stringSearch.search(parent, pattern);
            assert(result);
            done();
        });
        it("allows a backslash to escape an asterisk as literal", function(done){
            var parent = "C*Eval";
            var pattern = "C\\*Eval";
            var result = stringSearch.search(parent, pattern);
            assert(result);
            done();
        });
    });
});

