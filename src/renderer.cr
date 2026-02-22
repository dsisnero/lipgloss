require "colorprofile"

module Lipgloss
  # Lightweight renderer to satisfy lipgloss renderer API expectations.
  class Renderer
    property? has_dark_background : Bool = true
    @color_profile : Colorprofile::Profile = Colorprofile::Profile::TrueColor

    def color_profile : Colorprofile::Profile
      @color_profile
    end

    def color_profile=(profile : Colorprofile::Profile) : Nil
      @color_profile = profile
    end

    def has_dark_background? : Bool
      @has_dark_background
    end
  end

  def self.new_renderer(_io : IO, *_opts) : Renderer
    Renderer.new
  end
end
