<?php

function calculate($input) {
  $input = explode(" ", $input);
  $input = array_reverse($input);
  $stack = array();

  foreach ($input as $current_token) {
    if (in_array($current_token, array('-', '+', '*', '/'))) {
      if (count($stack) < 2)
        throw new MalformedInputException("Error: Not enough operands for operation: '$current_token'");
      
      $operand_1 = convert_to_number(array_pop($stack));
      $operand_2 = convert_to_number(array_pop($stack));

      switch ($current_token) {
        case '+':
          array_push($stack, ($operand_1 + $operand_2));
          break;
        case '-':
          array_push($stack, ($operand_1 - $operand_2));
          break;
        case '*':
          array_push($stack, ($operand_1 * $operand_2));
          break;
        case '/':
          if ($operand_2 == 0)
            throw new DivideByZeroException("Error: Division by Zero");

          array_push($stack, ($operand_1 / $operand_2));
          break;
      }
    } else {
      array_push($stack, $current_token);
    }
  }

  if (count($stack) > 1) {
    throw new MalformedInputException("Error: Not enough operations to be performed");
  }

  return array_pop($stack);
}

function convert_to_number($value) {
  $number = $value + 0;
  if ($value != "$number")
    throw new MalformedInputException("Error: Non-Numeric Input: $value");

  return $number;
}

class DivideByZeroException extends Exception {}
class MalformedInputException extends Exception {}
?>
