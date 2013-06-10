<?php

$input = file_get_contents('StringSearching.txt');
$input = explode("\n", $input);

foreach ($input as $line) {
  // Skip any blank lines in the input
  if (trim($line) == '')
    continue;

  // echo $line, "\n";

  $params = explode(",", $line);
  $string = $params[0];
  $pattern = $params[1];

  if (pattern_in_string($pattern, $string)) {
    print "true\n";
  } else {
    print "false\n";
  }
}

function pattern_in_string($pattern, $string) {
  $pattern = tokenize($pattern);
  $string = tokenize($string);

  $string = remove_leading_non_matched_characters($pattern, $string);

  while (True) {
    if (pattern_matched($pattern))
      return True;

    if (escaped_asterisk_matched_in_pattern($pattern, $string)) {
      // Remove the \* from the pattern and the * in the string
      $pattern = array_slice($pattern, 2);
      array_shift($string);
    }

    if ($string[0] == $pattern[0]) {
      // Remove a token from the string and pattern if they match
      array_shift($string);
      array_shift($pattern);
    } elseif ($pattern[0] == '*') {
      if ($pattern[1] == '*') {
        // Consolidate consecutive * tokens in the pattern
        array_shift($pattern);
        continue;
      }
      // Remove a token that don't match the
      // one following the * in the pattern
      array_shift($string);
      if ($pattern[1] == $string[0]) {
        $temp = $pattern;
        array_shift($temp);
        if (pattern_in_string($temp, $string)) {
          // The rest of the pattern matches after the *
          return True;
        } else {
          // The pattern after the * doesnt' match
          // Try matching another token with the * and continue
          array_shift($string);
        }
      }
    } else {
      return False;
    }
  }
  // The end of the input string has been reached without matching the pattern
  return False;
}

function tokenize($input) {
  if (!is_array($input)) {
    // Break the input string apart into an array of single character tokens
    $input = str_split($input);
  }
  return $input;
}

function remove_leading_non_matched_characters($pattern, $string) {
  $start_index = array_search($pattern[0], $string);
  $string = array_slice($string, $start_index);
 
  return $string;
}

function pattern_matched($pattern) {
    // The end of the pattern has been reached.
    if (count($pattern) == 0)
      return True;

    // If the pattern ends with a * then everything else matches
    if ($pattern[0] == '*' && count($pattern) == 1)
      return True;
}

function escaped_asterisk_matched_in_pattern($pattern, $string) {
  if (count($pattern) > 1
      && $string[0] == '*'
      && $pattern[0] == '\\'
      && $pattern[1] == '*'
     ) {
    return true;
  }
  return False;
}

?>
