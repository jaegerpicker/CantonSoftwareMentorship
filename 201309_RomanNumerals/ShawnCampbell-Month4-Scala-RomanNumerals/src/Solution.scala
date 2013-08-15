import scala.io.Source

object Solution {
  val values = 1000 :: 900 :: 500 :: 400 :: 100 :: 90 :: 50 :: 40 :: 10 :: 9 :: 5 :: 4 :: 1 :: List()
  val numerals = "M" :: "CM" :: "D" :: "CD" :: "C" :: "XC" :: "L" :: "XL" :: "X" :: "IX" :: "V" :: "IV" :: "I" :: List()
  var count = 0
  def main(args: Array[String]) {
    val result = time {Source.fromFile(args{0}).getLines.foreach(convert_num_to_roman)}
  }

  def convert_num_to_roman(num: String) {
    var number = num.toInt
    var res = ""
    for(i <- 0 to 12) {
      while (number > values{i}) {
        number = number - values{i}
        res += numerals{i}
      }
    }
    println(count + ": " + res)
    count += 1
  }

  def time[R](block: => R): R = {
    val t0 = System.nanoTime()
    val result = block
    val t1 = System.nanoTime()
    println("It took me: " + ((t1 - t0)/1E6) + " milliseconds")
    result
  }
}
