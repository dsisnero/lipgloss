require "ultraviolet"
require "./geometry"
require "./range"
require "./style"

module Lipgloss
  # Canvas is a cell-buffer that can be used to compose and draw Ultraviolet::Drawable
  # objects like Layers.
  #
  # Composed drawables are drawn onto the canvas in the order they were
  # composed, meaning later drawables will appear "on top" of earlier ones.
  #
  # A canvas can read, modify, and render its cell contents.
  #
  # It implements Ultraviolet::Screen and Ultraviolet::Drawable.
  class Canvas
    include Ultraviolet::Drawable
    include Ultraviolet::Screen

    @buffer : Ultraviolet::ScreenBuffer

    # Creates a new Canvas with the given size.
    def initialize(width : Int32, height : Int32)
      @buffer = Ultraviolet::ScreenBuffer.new(width, height)
      # Set width_method equivalent to ansi.GraphemeWidth
      # UV's DEFAULT_WIDTH_METHOD = ->(str : String) { UnicodeCharWidth.width(str) }
      # which matches Go's ansi.GraphemeWidth
    end

    # Resize resizes the canvas to the given width and height.
    def resize(width : Int32, height : Int32) : Nil
      @buffer.resize(width, height)
    end

    # Clear clears the canvas.
    def clear : Nil
      @buffer.clear
    end

    # Returns the bounding rectangle of the canvas.
    def bounds : Ultraviolet::Rectangle
      @buffer.bounds
    end

    # Returns the width of the canvas.
    def width : Int32
      @buffer.width
    end

    # Returns the height of the canvas.
    def height : Int32
      @buffer.height
    end

    # Returns the cell at position (x, y), or nil if out of bounds.
    # Note: Unlike Go's *uv.Cell pointer, this returns a value type.
    # Mutating the returned cell does not update the buffer.
    # Use set_cell to modify the buffer.
    def cell_at(x : Int32, y : Int32) : Ultraviolet::Cell?
      @buffer.cell_at(x, y)
    end

    # Sets the cell at position (x, y).
    def set_cell(x : Int32, y : Int32, cell : Ultraviolet::Cell?) : Nil
      @buffer.set_cell(x, y, cell)
    end

    # Returns the width calculation method used by the canvas.
    def width_method : Ultraviolet::WidthMethod
      @buffer.width_method
    end

    # Composes a drawable onto the canvas.
    def compose(drawable : Ultraviolet::Drawable) : Canvas
      drawable.draw(self, bounds)
      self
    end

    # Draws the canvas onto the given screen within the specified area.
    def draw(screen : Ultraviolet::Screen, area : Ultraviolet::Rectangle) : Nil
      @buffer.draw(screen, area)
    end

    # Renders the canvas into a styled string.
    def render : String
      Ultraviolet.trim_space(@buffer.render)
    end

    # Draws a string at position (x, y).
    # This method is not part of the Go API but is used by Layer.
    # It converts the string to Ultraviolet::Cell objects and sets them.
    def draw_string(str : String, x : Int32, y : Int32) : Nil
      return if width <= 0 || height <= 0

      lines = str.split("\n", remove_empty: false)
      lines.each_with_index do |line, idx|
        draw_line(line, x, y + idx)
      end
    end

    private def draw_line(line : String, x : Int32, y : Int32) : Nil
      return if y < 0 || y >= height
      return if line.empty?

      col = x
      # Simple implementation: create a cell for each grapheme
      # TODO: Parse ANSI sequences and apply styling to cells
      line.each_grapheme do |grapheme|
        break if col >= width
        next if col < 0

        # Create a cell with the grapheme
        cell = Ultraviolet::Cell.new_cell(width_method, grapheme)
        set_cell(col, y, cell)
        col += 1
      end
    end
  end

  def self.new_canvas(width : Int32, height : Int32) : Canvas
    Canvas.new(width, height)
  end
end
