require "crsfml"
require "./game/controller"
require "./game/player"

module Game
  VERSION = "0.1.0"

  window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "Game")
  window.vertical_sync_enabled = true # Prevent screen tearing

  controller = Controller.new({
    SF::Keyboard::Key::Left  => "moveLeft",
    SF::Keyboard::Key::Right => "moveRight",
    SF::Keyboard::Key::Up    => "moveUp",
    SF::Keyboard::Key::Down  => "moveDown",
  })

  size = window.size
  player = Player.new(x: size.x / 2, y: size.y / 2)

  # run the program as long as the window is open
  while window.open?
    # check all the window's events that were triggered since the last iteration of the loop
    while event = window.poll_event
      # "close requested" event: we close the window
      if event.is_a? SF::Event::Closed
        window.close
      end

      if event.is_a? SF::Event::Resized
        window.view.size = SF::Vector2.new(event.width, event.height)
      end

      controller.press(event.code) if event.is_a? SF::Event::KeyPressed
      controller.release(event.code) if event.is_a? SF::Event::KeyReleased
    end

    if controller.action?("moveRight")
      player.move_right
    end

    if controller.action?("moveLeft")
      player.move_left
    end

    if controller.action?("moveUp")
      player.move_up
    end

    if controller.action?("moveDown")
      player.move_down
    end

    window.clear(SF::Color::Black)
    player.update
    window.draw(player.sprite)
    window.display
    # end the current frame
  end
end
