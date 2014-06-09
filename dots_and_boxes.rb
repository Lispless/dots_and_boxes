require 'gosu'
require 'pry'
require_relative 'lib/bounding_box.rb'
require_relative 'lib/bounding_area.rb'
require_relative 'lib/Player.rb'
require_relative 'lib/Ground.rb'

class GameWindow < Gosu::Window
  def initialize
    super(700, 400, false)
    self.caption = "Dots and Boxes"

    @background_image = Gosu::Image.new(self, "media/ghbg.png", true)

    @player = Player.new(self)
    @player.warp(320, 240)
    @tile = Ground.new(self,120,240)
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.move_left
    end

    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.move_right
    end

    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      #@player.accelerate
    end

    #should not go through floor
    binding.pry
    if @player.player_hit_zone.left < @tile.hit_zone.right
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
