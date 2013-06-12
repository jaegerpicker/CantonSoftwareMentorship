function StringSearch(){
    this.search = function(parent, pattern){
        return new RegExp(pattern).test(parent);
    }
}

module.exports = new StringSearch();