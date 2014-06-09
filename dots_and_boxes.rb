require 'gosu'
require_relative 'lib/bounding_box.rb'
require_relative 'lib/bounding_area.rb'

class GameWindow < Gosu::Window
  def initialize
    super(700, 400, false)
    self.caption = "Dots and Boxes"

    @background_image = Gosu::Image.new(self, "media/ghbg.png", true)

    @player = Player.new(self)
    @player.warp(320, 240)
    @tile = Ground.new(self)
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.turn_left
    end

    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.turn_right
    end

    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.accelerate
    end
    @player.move
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

  class Player
    def initialize(window)
      @image = Gosu::Image.new(window, "media/tifa_stand.png", false)
      @x = @y = @vel_x = @vel_y = @angle = 0.0
      @score = 0
      @plateyer_hit_zone = BoundingBox.new(0, 0, 29, 62)
    end

    def warp(x, y)
      @x, @y = x, y
    end

    def turn_left
      @angle -= 4.5
    end

    def turn_right
      @angle += 4.5
    end

    def accelerate
      @vel_x += Gosu::offset_x(@angle, 0.5)
      @vel_y += Gosu::offset_y(@angle, 0.5)
    end

    def move
      @x += @vel_x
      @y += @vel_y
      @x %= 640
      @y %= 480

      @vel_x *= 0.95
      @vel_y *= 0.95
    end

    def draw
      @image.draw_rot(@x, @y, 1, @angle)
    end
  end

  class Ground
    def initialize(window)
      @image = Gosu::Image.new(window, "media/tile.png", false)
      @hit_zone = BoundingBox.new(0, 0, 66, 64)
    end

    def draw
      @image.draw(0, 350, 2)
      @image.draw(60, 350, 2)
      @image.draw(120, 350, 2)
      @image.draw(180, 350, 2)
      @image.draw(240, 350, 2)
      @image.draw(300, 350, 2)
      @image.draw(420, 350, 2)
      @image.draw(480, 350, 2)
      @image.draw(540, 350, 2)
    end
  end
end

window = GameWindow.new
window.show
