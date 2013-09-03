<?php
class Roman {
  private $conversion_values = array(
                                     '1000' => 'M',
                                     '900' => 'CM',
                                     '500' => 'D',
                                     '400' => 'CD',
                                     '100' => 'C',
                                     '90' => 'XC',
                                     '50' => 'L',
                                     '40' => 'XL',
                                     '10' => 'X',
                                     '9' => 'IX',
                                     '5' => 'V',
                                     '4' => 'IV',
                                     '1' => 'I'
                                    );

  public function convert($input) {
    if (is_numeric($input)) {
      return $this->to_roman($input);
    } else {
      return $this->to_decimal($input);
    }
  }

  public function to_roman($input) {
    $output = "";

    if ($input < 1 || $input > 4000 || !is_numeric($input)) {
      throw new InvalidArgumentException();
    }
    foreach ($this->conversion_values as $int => $string) {
      while ($input >= $int) {
        $output .= $string;
        $input -= $int;
      }

      if ($input == 0)
        return $output;
    } 
    throw new InvalidArgumentException();
  }

  public function to_decimal($input) {
    $output = 0;

    foreach ($this->conversion_values as $int => $string) {
      while (stripos($input, $string) === 0) {
        $output += $int; 
        $input = substr($input, strlen($string));
      } 

      if ($input == '') {
        return $output;
      }
    }

    throw new InvalidArgumentException(); 
  }
}
?>
