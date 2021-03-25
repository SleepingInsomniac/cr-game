module Game
  class Player
    property x, y, sprite

    def initialize(@x = 0.0, @y = 0.0)
      @vx = 0.0
      @vy = 0.0
      @speed = 0.5
      @friction = 0.95

      @sprite = SF::CircleShape.new(10)
      @sprite.fill_color = SF.color(100, 250, 50)
      @sprite.position = SF.vector2f(400, 300)
    end

    def move_right
      @vx += @speed
    end

    def move_left
      @vx -= @speed
    end

    def move_up
      @vy -= @speed
    end

    def move_down
      @vy += @speed
    end

    def update
      @x += @vx
      @y += @vy
      @vx *= @friction
      @vy *= @friction
      @sprite.position = SF.vector2f(@x, @y)
    end
  end
end
