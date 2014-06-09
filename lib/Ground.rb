class Ground
  attr_reader :hit_zone
  def initialize(window, x,y)
    @image = Gosu::Image.new(window, "media/tile.png", false)
    @hit_zone = BoundingBox.new(x, y, 66, 64)
    @x = x
    @y = y
  end

  def draw
    @image.draw(@x, @y, 2)
  end
end
