<?php
include __DIR__ . "/../prefix.php";

class PrefixTest extends PHPUnit_Framework_Testcase {
  /**
  * @dataProvider valid_data_sets
  */
  public function test_prefix_calculator_works_with_valid_data($result, $input) {
    $this->assertEquals($result, calculate($input));
  }

  /**
  * @dataProvider malformed_data_sets
  */
  public function test_prefix_calculator_returns_appropriate_errors($exception, $input) {
    $this->setExpectedException($exception);
    calculate($input);
  }

  public function valid_data_sets() {
    return array(
                 array(5, '+ 3 2'),
                 array(1, '- 3 2'),
                 array(6, '* 3 2'),
                 array(2, '/ 6 3'),
                 array(20, '* + 2 3 4'),
                 array(-7, '* - 5 6 7'),
                 array(5, '- * / 15 - 7 + 1 1 3 + 2 + 1 1'),
                 array(3, '+ 1.5 1.5'),
                 array('', ''),
                );
  }

  public function malformed_data_sets() {
    return array(
                 array('DivideByZeroException', '/ 2 0'), 
                 array('MalformedInputException', '9 2'),
                 array('MalformedInputException', '+ -'),
                 array('MalformedInputException', '+ - 1 2 3 4'),
                 array('MalformedInputException', '+ a b'),
                );
  }
}
?>
