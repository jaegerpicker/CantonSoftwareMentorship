#!/usr/bin/php
<?php
require __DIR__ . '/roman.php';

if (count($argv) != 2) {
  echo "Usage: $argv[0] <filename>\n";
  die();
}

$filename = $argv[1];

if (file_exists($filename)) {
  $input = file_get_contents($filename);
  $input = explode("\n", $input);

  $Roman = new Roman();

  foreach ($input as $line) {
    $line = trim($line);
    if ($line != '') {
      try {
        echo $Roman->convert($line), "\n";
      } catch(Exception $e) {
        echo $e->getMessage(), "\n";
      }
    }
  }
} else {
  die("Error: Input file does not exist.\n");
}
?>
