class solution {
    static void main (String[] args) {
        def line1
        def values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        def numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        line1 = new File(args[0]).eachLine { line ->
            def results = ""
            for(int i = 0; i < 13; i ++) {
                while ( line > values[i]) {
                    line -= values[i];
                    results += numerals[i];
                }
            }
            System.out.println(results)
        }
    }
}
