class ChessException < StandardError; end

class ChessBoard

  attr_reader :width, :height
  attr_accessor :visits

  def initialize(width, height)
    @width = width
    @height = height
    @visits = {}
  end

  def add_piece(x, y)
    raise ChessException.new('越界了!') if x >= width || y >= height || x < 0 || y < 0
    raise ChessException.new('已存在!') if visits["#{ x }_#{ y }"]

    piece = ChessPiece.new(x, y, self)
    visits["#{ x }_#{ y }"] = 1
    piece
  end
end

class ChessPiece

  attr_reader :x, :y, :board
  def initialize(x, y, board)
    @board = board
    raise ChessException.new('Parameters of the cross!') if x >= board.width || y > board.height
    raise ChessException.new('location already exists!') if visits["#{ x }_#{ y }"]
    visits["#{ x }_#{ y }"] = 1
    @x = x
    @y = y
  end

  def position_to_s
    "#{ x }_#{ y }"
  end

  def visits
    board.visits
  end

  def all_next_steps
    steps = []
    for i in 0...board.width
      next if i == x
      for j in (y + 1)...board.height
        steps << [i, j] if visits["#{ i }_#{ j }"].nil?
      end
    end

    steps
  end

  def move_to(move_to_x, move_to_y)
    if move_to_x == x || move_to_y <= y || visits["#{ move_to_x }_#{ move_to_y }"] || move_to_x >= board.width || move_to_y >= board.height || move_to_x < 0
      raise ChessException.new('position of illegal!')
    end

    visits["#{ move_to_x }_#{ move_to_y }"] = 1
    x = move_to_x
    y = move_to_y
    visits.delete(position_to_s)
  end
end

b = ChessBoard.new(8, 8)
p1 = b.add_piece(1, 1)
p1.all_next_steps
ChessPiece.new(9, 7, b)