require "./spec_helper"

describe "Lipgloss parity: compat color" do
  it "proxies compat globals to runtime state" do
    original_dark = Lipgloss::Compat.has_dark_background
    original_profile = Lipgloss::Compat.profile

    begin
      Lipgloss::Compat.has_dark_background = false
      Lipgloss.has_dark_background?.should be_false
      Lipgloss::Compat.has_dark_background.should be_false

      Lipgloss::Compat.has_dark_background = true
      Lipgloss.has_dark_background?.should be_true
      Lipgloss::Compat.has_dark_background.should be_true

      Lipgloss::Compat.profile = Lipgloss::ColorProfile::ANSI
      Lipgloss::Compat.profile.should eq(Lipgloss::ColorProfile::ANSI)
      Lipgloss::StyleRenderer.default.color_profile.should eq(Lipgloss::ColorProfile::ANSI)
    ensure
      Lipgloss::Compat.has_dark_background = original_dark
      Lipgloss::Compat.profile = original_profile
    end
  end

  it "selects adaptive colors using compat background mode" do
    original_dark = Lipgloss::Compat.has_dark_background

    begin
      adaptive = Lipgloss::Compat::AdaptiveColor.new(
        Lipgloss::Color.from_hex("#112233"),
        Lipgloss::Color.from_hex("#AABBCC")
      )

      Lipgloss::Compat.has_dark_background = false
      adaptive.resolve.to_rgb.should eq({17, 34, 51})

      Lipgloss::Compat.has_dark_background = true
      adaptive.resolve.to_rgb.should eq({170, 187, 204})
    ensure
      Lipgloss::Compat.has_dark_background = original_dark
    end
  end
end
