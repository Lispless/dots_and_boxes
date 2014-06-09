class Player
  attr_reader :player_hit_zone
  attr_accessor :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "media/tifa_stand.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
    @player_hit_zone = BoundingBox.new(@x, @y, 29, 62)
  end

  def warp(x, y)
    @x, @y = x, y
    @player_hit_zone.x = x
    @player_hit_zone.y = y
  end

  def move_left
    @vel_x += Gosu::offset_x(270, 0.5)
  end

  def move_right
    @vel_x += Gosu::offset_x(90, 0.5)
  end

  # def accelerate

  #   @vel_y += Gosu::offset_y(180, 0.5)
  # end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @player_hit_zone.x = @x
    @player_hit_zone.y = @y

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
