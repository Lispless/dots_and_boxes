class Player
  attr_reader :hit_box , :vel_y, :vel_x
  attr_accessor :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "media/tifa_stand.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
    @hit_box = BoundingBox.new(@x, @y, 29, 62)
  end

  def warp(x, y)
    @x, @y = x, y
    @hit_box.x = x
    @hit_box.y = y
  end

  def move_left
    @vel_x += Gosu::offset_x(270, 0.5)
  end

  def move_right
    @vel_x += Gosu::offset_x(90, 0.5)
  end

  def move_up
    @vel_y += Gosu::offset_y(0, 2)
  end
  # def accelerate

  #   @vel_y += Gosu::offset_y(180, 0.5)
  # end

  def colide?(object)
    x_colide = false
    y_colide = false
    if ((@hit_box.right+@vel_x >= object.left &&
      @hit_box.right+@vel_x <= object.right) ||
      (@hit_box.left+@vel_x <= object.right &&
        @hit_box.left+@vel_x >= object.left)) &&
       ((@hit_box.top+@vel_y >= object.bottom &&
        @hit_box.top+@vel_y <= object.top) ||
        (@hit_box.bottom+@vel_y <= object.top &&
        @hit_box.bottom+@vel_y >= object.bottom))
      @vel_y *= 0
      @vel_x *= 0

    end
    if x_colide && y_colide
      return true
    else
      return false
    end
  end
  def update(window)

    if window.button_down? Gosu::KbLeft
      self.move_left
    end
    if window.button_down? Gosu::KbRight
      self.move_right
    end
    if window.button_down? Gosu::KbSpace
      self.move_up
    end
    if @vel_y >= window.max_fall
      @vel_y = window.max_fall
    else
      @vel_y += window.gravity
    end
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @hit_box.x = @x
    @hit_box.y = @y

    @vel_x *= 0.95
    #@vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
