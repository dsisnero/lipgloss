require "ultraviolet"

module Lipgloss
  struct Point
    getter x : Int32
    getter y : Int32

    def initialize(@x : Int32, @y : Int32)
    end

    def to_uv : Ultraviolet::Position
      Ultraviolet::Position.new(@x, @y)
    end

    def self.from_uv(pos : Ultraviolet::Position) : Point
      Point.new(pos.x, pos.y)
    end
  end

  struct Rectangle
    getter min : Point
    getter max : Point

    def initialize(@min : Point, @max : Point)
    end

    def self.zero : Rectangle
      new(Point.new(0, 0), Point.new(0, 0))
    end

    def self.from_xywh(x : Int32, y : Int32, width : Int32, height : Int32) : Rectangle
      new(Point.new(x, y), Point.new(x + width, y + height))
    end

    def dx : Int32
      @max.x - @min.x
    end

    def dy : Int32
      @max.y - @min.y
    end

    def width : Int32
      dx
    end

    def height : Int32
      dy
    end

    def overlaps?(other : Rectangle) : Bool
      @min.x < other.max.x &&
        other.min.x < @max.x &&
        @min.y < other.max.y &&
        other.min.y < @max.y
    end

    def contains?(x : Int32, y : Int32) : Bool
      x >= @min.x && x < @max.x &&
        y >= @min.y && y < @max.y
    end

    def union(other : Rectangle) : Rectangle
      min_x = @min.x < other.min.x ? @min.x : other.min.x
      min_y = @min.y < other.min.y ? @min.y : other.min.y
      max_x = @max.x > other.max.x ? @max.x : other.max.x
      max_y = @max.y > other.max.y ? @max.y : other.max.y
      Rectangle.new(Point.new(min_x, min_y), Point.new(max_x, max_y))
    end

    def to_uv : Ultraviolet::Rectangle
      Ultraviolet::Rectangle.new(@min.to_uv, @max.to_uv)
    end

    def self.from_uv(rect : Ultraviolet::Rectangle) : Rectangle
      Rectangle.new(Point.from_uv(rect.min), Point.from_uv(rect.max))
    end
  end
end
