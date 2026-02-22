require "colorprofile"

module Lipgloss
  # Alias to the colorprofile shard's Profile enum for compatibility
  # Go lipgloss uses colorprofile.Profile with values: ANSI, ANSI256, TrueColor, ASCII, NoTTY
  alias ColorProfile = Colorprofile::Profile

  # StyleRenderer provides lipgloss-compatible color profile management.
  class StyleRenderer
    @@default : StyleRenderer = StyleRenderer.new

    property color_profile : ColorProfile = ColorProfile::TrueColor
    property? has_dark_background : Bool = true

    def self.default : StyleRenderer
      @@default
    end

    def self.default=(renderer : StyleRenderer)
      @@default = renderer
    end

    def has_dark_background? : Bool
      @has_dark_background
    end
  end
end
