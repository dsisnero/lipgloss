module Lipgloss
  # Compat mirrors Go's lipgloss/compat package behavior by exposing mutable
  # global profile/background settings and color helper types.
  module Compat
    alias AdaptiveColor = Lipgloss::AdaptiveColor
    alias CompleteColor = Lipgloss::CompleteColor
    alias CompleteAdaptiveColor = Lipgloss::CompleteAdaptiveColor

    def self.has_dark_background : Bool
      Lipgloss.has_dark_background?
    end

    def self.has_dark_background=(value : Bool)
      Lipgloss.has_dark_background = value
    end

    def self.profile : ColorProfile
      StyleRenderer.default.color_profile
    end

    def self.profile=(value : ColorProfile)
      StyleRenderer.default.color_profile = value
    end

    # Initialize defaults from current runtime state.
    self.has_dark_background = Lipgloss.has_dark_background?
    self.profile = StyleRenderer.default.color_profile
  end
end
