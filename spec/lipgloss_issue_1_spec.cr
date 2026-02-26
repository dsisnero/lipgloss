require "./spec_helper"

describe "Lipgloss issue #1 API surface" do
  it "exposes list-related parity APIs" do
    style = Lipgloss.new_style
      .padding(1, 2)
      .padding_left(3)
      .margin(1, 2)
      .margin_top(2)
      .foreground("#ffffff")
      .background("#000000")
      .border(Lipgloss.normal_border)
      .border_foreground(
        Lipgloss::Color.from_hex("#333333"),
        Lipgloss::Color.from_hex("#444444"),
        Lipgloss::Color.from_hex("#555555"),
        Lipgloss::Color.from_hex("#666666")
      )
      .underline(true)
      .set_string("hello")
      .height(3)

    style.get_padding_left.should be >= 0
    style.get_padding_right.should be >= 0
    style.get_margin_top.should be >= 0

    inherited = Lipgloss.new_style.inherit(style)
    inherited.should be_a(Lipgloss::Style)

    Lipgloss.height("a\nb").should eq(2)
    Lipgloss.join_vertical(Lipgloss::Position::Top, "a", "b").should be_a(String)

    chooser = Lipgloss.light_dark(true)
    chooser.call(Lipgloss::Color::WHITE, Lipgloss::Color::BLACK).should eq(Lipgloss::Color::BLACK)

    styled = Lipgloss.style_runes("abc", [1], Lipgloss.new_style.bold(true), Lipgloss.new_style)
    Lipgloss.width(styled).should eq(3)
  end
end
