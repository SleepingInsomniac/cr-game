module Game
  # Handle button to action mapping in a dynamic way
  class Controller
    def initialize(@mapping : Hash(SF::Keyboard::Key, String))
      @keysdown = {} of String => Bool

      @mapping.values.each do |key|
        @keysdown[key] = false
      end
    end

    def registered?(button)
      @mapping.keys.includes?(button)
    end

    def press(button)
      return false unless registered?(button)
      @keysdown[@mapping[button]] = true
    end

    def release(button)
      return false unless registered?(button)
      @keysdown[@mapping[button]] = false
    end

    def action?(name)
      return false unless @keysdown.keys.includes?(name)
      @keysdown[name]
    end
  end
end
