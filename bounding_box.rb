class BoundingBox
  def initialize(left, bottom, width, height)
    @left = left
    @bottom = bottom
    @width = width
    @height = height
  end

  def width
    @width
  end

  def height
    @height
  end

  def left
    @left
  end

  def right
    right = left + width
  end

  def top
    top = bottom + height
  end

  def bottom
    @bottom
  end

  def contains_point?(x, y)
    if x >= left && y >= bottom && x <= right && y <= top
      true
    else
      false
    end
  end
end
