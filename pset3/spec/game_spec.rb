require "spec_helper"
require "game"

describe Game do
  describe "initialize" do
    it "news up a game with a board" do
      game = Game.new
      expect(game.board).to eq (
                                 [
                                   [15, 14, 13, 12],
                                   [11, 10, 9, 8],
                                   [7, 6, 5, 4],
                                   [3, 2, 1, "X"],
                                 ]
                               )
    end
  end

  describe "#move" do
    it "moves a given number in a given direction" do
      game = Game.new
      game.move(1, "right")
      expect(game.board).to eq (
                                 [
                                   [15, 14, 13, 12],
                                   [11, 10, 9, 8],
                                   [7, 6, 5, 4],
                                   [3, 2, "X", 1],
                                 ]
                               )
      game.move(1, "left")
      expect(game.board).to eq (
                                 [
                                   [15, 14, 13, 12],
                                   [11, 10, 9, 8],
                                   [7, 6, 5, 4],
                                   [3, 2, 1, "X"],
                                 ]
                               )

      game.move(4, "down")
      expect(game.board).to eq (
                                 [
                                   [15,14,13,12],
                                   [11,10,9,8],
                                   [7,6,5,"X"],
                                   [3,2,1,4],
                                 ]
                               )
      game.move(4, "up")
      expect(game.board).to eq (
                                 [
                                   [15,14,13,12],
                                   [11,10,9,8],
                                   [7,6,5,4],
                                   [3,2,1,"X"],
                                 ]
                               )
    end

    it "doesn't allow moves that would go off of the board" do
      game = Game.new
      expect {
        game.move(3, "left")
      }.to raise_error "Not Allowed"

      game = Game.new
      expect {
        game.move(15, "up")
      }.to raise_error "Not Allowed"

      game = Game.new
      expect {
        game.move(3, "down")
      }.to raise_error "Not Allowed"

      game = Game.new
      expect {
        game.move(8, "right")
      }.to raise_error "Not Allowed"
    end

    it "doesn't allow moving to spaces that are occupied" do
      game = Game.new
      expect {
        game.move(5, "right")
      }.to raise_error "Not Allowed"

      game = Game.new
      expect {
        game.move(5, "down")
      }.to raise_error "Not Allowed"

      game = Game.new
      expect {
        game.move(5, "up")
      }.to raise_error "Not Allowed"

      game = Game.new
      expect {
        game.move(5, "left")
      }.to raise_error "Not Allowed"
    end
  end
end