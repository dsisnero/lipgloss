require "./spec_helper"

describe "Lipgloss parity: get accessors" do
  it "returns default values for unset style properties" do
    style = Lipgloss::Style.new

    style.get_bold.should be_false
    style.get_italic.should be_false
    style.get_underline.should be_false
    style.get_underline_style.should eq(Lipgloss::UnderlineNone)
    style.get_strikethrough.should be_false
    style.get_reverse.should be_false
    style.get_blink.should be_false
    style.get_faint.should be_false
    style.get_width.should eq(0)
    style.get_height.should eq(0)
    style.get_align.should eq(Lipgloss::Position::Left)
    style.get_align_vertical.should eq(Lipgloss::Position::Top)
    style.get_padding.should eq({0, 0, 0, 0})
    style.get_margin.should eq({0, 0, 0, 0})
    style.get_foreground.should be_a(Lipgloss::NoColor)
    style.get_background.should be_a(Lipgloss::NoColor)
  end

  it "returns configured values through get_* wrappers" do
    style = Lipgloss::Style.new
      .bold
      .italic
      .underline_style(Lipgloss::UnderlineDouble)
      .strikethrough
      .reverse
      .blink
      .faint
      .align(Lipgloss::Position::Center, Lipgloss::Position::Bottom)
      .padding(1, 2, 3, 4)
      .margin(2, 3, 4, 5)
      .width(42)
      .height(7)
      .max_width(80)
      .max_height(24)
      .tab_width(3)
      .foreground(Lipgloss::Color::RED)
      .background(Lipgloss::Color::BLUE)
      .border_style(Lipgloss::Border.normal)
      .border_top(true)
      .border_right(true)
      .border_bottom(false)
      .border_left(true)

    style.get_bold.should be_true
    style.get_italic.should be_true
    style.get_underline.should be_true
    style.get_underline_style.should eq(Lipgloss::UnderlineDouble)
    style.get_strikethrough.should be_true
    style.get_reverse.should be_true
    style.get_blink.should be_true
    style.get_faint.should be_true
    style.get_width.should eq(42)
    style.get_height.should eq(7)
    style.get_align.should eq(Lipgloss::Position::Center)
    style.get_align_horizontal.should eq(Lipgloss::Position::Center)
    style.get_align_vertical.should eq(Lipgloss::Position::Bottom)
    style.get_padding.should eq({1, 2, 3, 4})
    style.get_margin.should eq({2, 3, 4, 5})
    style.get_horizontal_padding.should eq(6)
    style.get_vertical_padding.should eq(4)
    style.get_horizontal_margins.should eq(8)
    style.get_vertical_margins.should eq(6)
    style.get_max_width.should eq(80)
    style.get_max_height.should eq(24)
    style.get_tab_width.should eq(3)

    border, top, right, bottom, left = style.get_border
    border.should eq(Lipgloss::Border.normal)
    {top, right, bottom, left}.should eq({true, true, false, true})
  end
end
