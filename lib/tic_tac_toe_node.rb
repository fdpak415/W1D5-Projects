require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :prev_mov_pos,:next_mover_mark, :board, :children

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @board = board
    @children = []
    populate_children
  end

  def populate_children
  end

  def losing_node?(evaluator)
    return true if @board.over? && @board.winner != evaluator
    if evaluator == @next_mover_mark
      @children.all? {|child| child.losing_node?(evaluator)}
    else
      @children.any? {|child| child.losing_node(evaluator)}
    end
  end

  def winning_node?(evaluator)
    return true if @board.over? && @board.winner == evaluator
    if evaluator == @next_mover_mark
      @children.any? {|child| child.winning_node?(evaluator)}
    else
      @children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    @children
  end
end
