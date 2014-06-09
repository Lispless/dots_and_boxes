require 'gosu'
require_relative 'lib/bounding_box.rb'
require_relative 'lib/bounding_area.rb'
require_relative 'lib/Player.rb'
require_relative 'lib/Ground.rb'

class GameWindow < Gosu::Window
  attr_reader :gravity, :max_fall
  def initialize
    super(700, 400, false)
    self.caption = "Dots and Boxes"

    @background_image = Gosu::Image.new(self, "media/ghbg.png", true)

    @player = Player.new(self)
    @player.warp(320, 240)
    @tile = Ground.new(self, 120,240)
    @gravity = 0.9
    @max_fall = 2
  end

  def update
    @player.update(self)
    if !@player.colide?(@tile.hit_zone)
      @player.move
    end
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
    @tile.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
