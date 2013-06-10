#!/usr/bin/php
<?php
require __DIR__ . '/prefix.php';

if (count($argv) != 2) {
  echo "Usage: $argv[0] <filename>\n";
  die();
}

$filename = $argv[1];

if (file_exists($filename)) {
  $input = file_get_contents($filename);
  $input = explode("\n", $input);

  foreach ($input as $line) {
    if (trim($line) != '') {
      try {
        echo calculate($line), "\n";
      } catch(Exception $e) {
        echo $e->getMessage(), "\n";
      }
    }
  }
} else {
  die("Error: Input file does not exist.\n");
}
?>
