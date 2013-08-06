require 'rspec'

class MineSweeperSolver
  attr_accessor :rows
  def initialize (map)
    parse_map(map)
  end
  def parse_map(map)
    data = map.split(';')
    grid_data = data[1].to_s.split(//)
    grid_data_counter = 0
    @rows = []
    how_wide?(map).times do
      cells = []
      how_high?(map).times do
        cell_data = grid_data[grid_data_counter]
        cells << MineSweeperCell.new(cell_data == '*')
        grid_data_counter = grid_data_counter + 1
      end
      rows << MineSweeperRow.new(cells)
    end
  end

  def how_wide?(map)
    grid_size = map.split(';')[0].split(',')
    grid_size[0].to_i    
  end
  def how_high?(map)
    grid_size = map.split(';')[0].split(',')
    grid_size[1].to_i    
  end

  def mines_nearby (cell)
    neighbors(cell).select { |cell| cell.mine? }
  end

  def cell_location(a_cell)
    r = 0
    @rows.each do |row|
      if row.includes?(a_cell)
        return [r, row.position(a_cell)]
      end
      r += 1
    end
  end
  
  def neighbors(a_cell)
    neighbors = []

    3.times do |row|
      3.times do |cell|
        if !center_cell(row, cell)
          neighbors << neighbor(a_cell, row - 1, cell - 1)
        end
      end
    end

    neighbors.reject{ |cell| cell.nil? }
  end

  def center_cell(row, cell)
    (row == 1 && cell == 1)
  end

  def neighbor(a_cell, horiz_dir, virt_dir)
    location = cell_location(a_cell)
    row = location[0] + horiz_dir
    cell = location[1] + virt_dir
    return nil if !valid_cell(row, cell)
    cell(row, cell)
  end

  def valid_cell(row, cell)
    within_range(row) && within_range(cell)
  end

  def within_range(location)
    location >= 0 && location < rows.first.cells.size
  end

  def cell(row, cell)
    row = rows[row]
    if (!row.nil?)
      return row.cells[cell]
    end
  end

  def solve
    result = ''
    rows.each do |row|
      row.cells.each do |cell|
        result += result_cell(cell)
      end
    end
    result
  end
  def result_cell(cell)
    return '*' if cell.mine?
    mines_nearby(cell).size.to_s
  end
end

class MineSweeperRow
  attr_accessor :cells
  def initialize (cells)
    @cells = cells
  end
  def includes?(a_cell)
    !@cells.index(a_cell).nil?
  end
  def position(a_cell)
    c = 0
    @cells.each do |cell|
      if cell == a_cell
        return c
      end
      c += 1
    end
  end
end
class MineSweeperCell
  def initialize (is_a_mine)
    @is_a_mine = is_a_mine
  end
  def mine?
    @is_a_mine
  end
end

ARGV.each do |arg|
  File.open(arg, "r").each_line do |line|
    solver = MineSweeperSolver.new line
    puts solver.solve
  end
end

describe MineSweeperSolver do
  context 'with a 3 by 5 grid that has a mine in the center' do
    evaluator = MineSweeperSolver.new ('3,5;.......*.......')
    it 'parses string for 3 rows' do
      evaluator.rows.size.should == 3
    end
    it 'parses string for 5 cols' do
      evaluator.rows.each do |row|
        row.cells.size.should == 5
      end
    end
    it 'can locate a cell' do
      cell = evaluator.rows[1].cells[4]
      location = evaluator.cell_location(cell)
      location.should == [1, 4]
    end
    it 'knows where the mines are' do
      evaluator.cell(1, 2).mine?.should == true
    end
    it 'can find a cell neighborhood' do
      cell = evaluator.rows[1].cells[1]
      evaluator.neighbors(cell).size.should == 8
    end
    it 'can find the first cell neighborhood' do
      cell = evaluator.rows.first.cells.first
      evaluator.neighbors(cell).size.should == 3
    end
    it 'can find the last cell neighborhood' do
      cell = evaluator.rows.last.cells.last
      evaluator.neighbors(cell).size.should == 3
    end
    it 'knows when a mine is not in the neighborhood' do
      cell = evaluator.rows.first.cells.first
      evaluator.mines_nearby(cell).size.should == 0
    end
    it 'knows when a mine is in the neighborhood' do
      cell = evaluator.rows.first.cells[2]
      evaluator.mines_nearby(cell).size.should == 1
    end
  end
  it 'knows a solution' do
    evaluator = MineSweeperSolver.new ('3,5;**.........*...')
    evaluator.solve.should == '**100332001*100'
  end
  it 'knows the other solution' do
    evaluator = MineSweeperSolver.new ('4,4;*........*......')
    evaluator.solve.should == '*10022101*101110'
  end

end
