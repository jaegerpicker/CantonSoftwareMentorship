#!/usr/bin/php
<?php
require __DIR__ . '/minesweeper.php';

if (count($argv) != 2) {
  echo "Usage: $argv[0] <filename>\n";
  die();
}
$filename = $argv[1];

if (file_exists($filename)) {
  $input = file_get_contents($filename);
  $input = explode("\n", $input);

  $Minesweeper = new Minesweeper();

  foreach ($input as $line) {
    if (trim($line) != '') {
      try {
        $input = format_input($line);
        $output = $Minesweeper->add_clues($input);
        echo format_output($output) . "\n";
      } catch(Exception $e) {
        echo $e->getMessage(), "\n";
      }
    }
  }
} else {
  die("Error: Input file does not exist.\n");
}

function format_input($input) {
  $output = array();
  $input = explode(';', $input);
  // rows, cols in input[0], grab just the cols count.
  $cols = explode(',', $input[0])[1];
  $values = str_split($input[1]);

  $row = 0;
  $i = 0;
  foreach ($values as $value) {
    $output[$row][] = $value; 
    $i++;
    if ($i == $cols) {
      $i = 0;
      $row++;
    }
  }
  return $output;
}

function format_output($input) {
  $output = "";

  foreach ($input as $row) {
    $output .= implode('',$row);
  }

  return $output;
}
?>
