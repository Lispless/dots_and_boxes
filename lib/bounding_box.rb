class BoundingBox
  attr_reader :width, :height

  def initialize(xstart,ystart,width,height)
    @xstart = xstart
    @ystart = ystart
    @width = width
    @height = height
  end

  def left
    @xstart
  end

  def right
    @xstart+@width
  end

  def bottom
    @ystart
  end

  def top
    @ystart+height
  end

  def contains_point?(x,y)
    if x >= left && x <= right && y >= bottom && y <= top
      true
    else
      false
    end
  end

end
