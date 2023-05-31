class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def play(place_holder)
    puts "#{name}'s turn"
    puts "Choose a position between 1-9 to place your marker:"
    choice = gets.chomp.to_i

    place_holder.each_with_index do |value, index|
      if value == choice
        place_holder[index] = @marker
      end
    end
  end
end

class Board
  def print_board(place_holder)
    3.times { print "+---" }
    puts '+'

    place_holder.each_slice(3) do |row|
      row.each { |value| print "| #{value} " }
      puts '|'
      3.times { print "+---" }
      puts '+'
    end
  end
end

def play_round(place_holder)
    players = create_players

    board = Board.new
    board.print_board(place_holder)
    
    1..4.times do
        players.each do |player|
            player.play(place_holder)
            board.print_board(place_holder)
        end
  end
end

def create_players
  players = []

  puts "Name:"
  f_name = gets.chomp
  puts "Choose your marker, either X or O:"
  f_marker = gets.chomp.upcase

  players << Player.new(f_name, f_marker)

  puts "Name:"
  sec_name = gets.chomp
  sec_marker = (f_marker == 'X') ? 'O' : 'X'

  players << Player.new(sec_name, sec_marker)

  players
end

place_holder = [1, 2, 3, 4, 5, 6, 7, 8, 9]
play_round(place_holder)
