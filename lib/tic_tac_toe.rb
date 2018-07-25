WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board,position,pl_character)
  board[position] = pl_character
end

def position_taken?(board,position)
  board[position] == "X" || board[position] == "O"
end

def valid_move?(board,position)
  !position_taken?(board,position) && position.between?(0,8)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |entries|
    if entries == "X" || entries == "O"
      count += 1
    end
  end
  count
end  

def current_player(board)
  turn_count(board) % 2 == 0 ? "X":"O"
end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    @board.all?{|square| square != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end





