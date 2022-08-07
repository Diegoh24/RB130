class Diamond
  attr_reader :letter, :position, :output, :spaces_between

  LETTERS = %w( A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

  def initialize(letter)
    @letter = letter
    @position = LETTERS.index(letter)
    @output = []
    @spaces_between = make_spaces_between
  end

  def self.make_diamond(letter)
    Diamond.new(letter).make_diamond
  end

  def make_diamond
    make_top
    make_bottom
    output.join
  end

  def make_top
    0.upto(position) do |row|
      row == 0 ? end_row : row(row)
    end
  end

  def make_bottom
    (position - 1).downto(0) do |row|
      row == 0 ? end_row : row(row)
    end
  end

  def make(spaces)
    "#{(' ' * spaces.to_i)}"
  end

  def make_spaces_between
    (0..position).each_with_object([]) do |row, arr|
      arr << (row > 1? arr.last + 2 : row)
    end
  end

  def end_row
    output << "#{make(position)}#{LETTERS.first}#{make(position)}\n"
  end

  def row(row)
    spaces = make(position - row)
    between = make(spaces_between[row])
    letter = LETTERS[row]
    output << "#{spaces}#{letter}#{between}#{letter}#{spaces}\n"
  end
end