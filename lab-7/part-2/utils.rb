# frozen_string_literal: true

# window class
class Window
  attr_reader :width, :height

  def initialize(width, height)
    if !(width.is_a?(Integer) || width.is_a?(Float)) || !width.positive?
      raise TypeError, "'width' must be a positive integer!"
    end

    if !(height.is_a?(Integer) || height.is_a?(Float)) || !height.positive?
      raise TypeError, "'height' must be a positive integer!"
    end

    @width = width
    @height = height
  end

  def square
    width * height
  end
end

# advanced window class
class AdvancedWindow < Window
  attr_reader :jalousie

  def initialize(width, height, jalousie)
    raise TypeError, "'jalousie' must be a positive integer!" unless [true, false].include? jalousie

    super width, height
    @jalousie = jalousie
  end

  def jalousie?
    @jalousie
  end
end
