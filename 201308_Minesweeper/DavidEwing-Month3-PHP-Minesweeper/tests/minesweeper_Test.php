<?php
require __DIR__ . "/../minesweeper.php";

class MinesweeperTest extends PHPUnit_Framework_TestCase {

  /**
  * @dataProvider provider
  */
  public function test_add_clues($input, $expected) {
    $Minesweeper = new Minesweeper();

    $this->assertEquals($expected, $Minesweeper->add_clues($input));
  }

  public function provider() {
    return array(array(array(), array()),
                 array(
                       array(array('.', '.', '.'), // input
                             array('.', '*', '.'),
                             array('.', '.', '.')
                            ),
                       array(array(1,  1,  1), // expected
                             array(1, '*', 1),
                             array(1,  1,  1)
                            )
                      ),
                 array(
                       array(array('.')), // input
                       array(array(0)) // expected
                      ),
                 array(array(array('.', '.', '.'), // input
                             array('*', '*', '.'),
                             array('.', '.', '.')
                            ),
                       array(array(2,    2,  1), // expected
                             array('*', '*', 1),
                             array(2,    2,  1)
                            )
                       ),
                );
  }

}
?>
