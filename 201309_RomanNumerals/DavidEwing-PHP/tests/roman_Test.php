<?php
require __DIR__ . "/../roman.php";

class RomanTest extends PHPUnit_Framework_TestCase {

  private function getRoman() {
    return new Roman(); 
  }

  /**
  * @dataProvider data_provider
  */
  public function test_int_to_roman_conversion($result, $input) {
    $Roman = $this->getRoman();
    $this->assertEquals($result, $Roman->to_roman($input));
  }

  /**
  * @dataProvider data_provider
  */
  public function test_roman_to_int_conversion($input, $result) {
    $Roman = $this->getRoman();
    $this->assertEquals($result, $Roman->to_decimal($input)); 
  }

  /**
  * @expectedException InvalidArgumentException
  */
  public function test_negative_numbers() {
    $Roman = $this->getRoman();
    $Roman->to_roman(-1); 
  }

  /**
  * @expectedException InvalidArgumentException
  */
  public function test_number_too_large() {
    $Roman = $this->getRoman();
    $Roman->to_roman(1000000); 
  }

  /**
  * @expectedException InvalidArgumentException
  */
  public function test_to_roman_invalid_input() {
    $Roman = $this->getRoman();
    $Roman->to_roman('123ABC'); 
  }

  /**
  * @expectedException InvalidArgumentException
  */
  public function test_to_decimal_invalid_input() {
    $Roman = $this->getRoman();
    $Roman->to_roman('ABC'); 
  }


  public function data_provider() {
    return array(
                  array('I', 1),
                  array('II', 2),
                  array('IV', 4),
                  array('V', 5),
                  array('VI', 6),
                  array('IX', 9),
                  array('X', 10),
                  array('XII', 12),
                  array('XV', 15),
                  array('XXIV', 24),
                  array('XXXIX', 39),
                  array('XLIV', 44),
                  array('XLIX', 49),
                  array('XCIV', 94),
                  array('CLIX', 159),
                  array('CCXCVI', 296),
                  array('MMMCMXCII', 3992),
                );
  } 
}
?>
