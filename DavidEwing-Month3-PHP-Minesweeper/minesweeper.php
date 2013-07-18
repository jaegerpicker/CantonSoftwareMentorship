<?php
class Minesweeper {
  private $field;

  public function add_clues($field) {
    $this->field = $field;
    foreach ($field as $row => $values) {
      foreach ($values as $col => $value) {
        $field[$row][$col] = $this->count_neighbors($row, $col); 
      }
    } 
    return $field;
  }

  private function count_neighbors($row, $col) {
    if ($this->field[$row][$col] == '*') {
      return '*';
    } else {
      $count = 0;

      if ($row != 0) {
        $count += $this->count_row($row - 1, $col);
      }

      $count += $this->count_row($row, $col);

      if ($row + 1 != count($this->field)) {
        $count += $this->count_row($row + 1, $col); 
      }

      return $count;
    }
  }

  private function count_row($row, $col) {
    $count = 0;

    if ($col != 0)
      $count += ($this->field[$row][$col - 1] == '*') ? 1 : 0;

    $count += ($this->field[$row][$col] == '*') ? 1 : 0;

    if ($col + 1 != count($this->field[$row]))
      $count += ($this->field[$row][$col + 1] == '*') ? 1 : 0;
    
    return $count;
  }
}
?>
