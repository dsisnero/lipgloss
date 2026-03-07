require "./spec_helper"

describe Lipgloss::Style do
  describe "value semantics (matching Go behavior)" do
    it "border_style returns a new Style, not modifying the receiver" do
      s1 = Lipgloss::Style.new
      s2 = s1.border_style(Lipgloss::Border.thick)

      # s1 should remain unchanged (no border style set)
      s1.border_style.top.should eq("")

      # s2 should have thick border
      s2.border_style.top.should eq("━")
    end

    it "border_style chaining works correctly" do
      s3 = Lipgloss::Style.new
      s4 = s3.border_style(Lipgloss::Border.thick).border_style(Lipgloss::Border.hidden)

      # s3 should remain unchanged (empty border)
      s3.border_style.top.should eq("")

      # s4 should have hidden border (not thick, because chaining)
      s4.border_style.top.should eq(" ")
    end

    it "border_top returns a new Style, not modifying the receiver" do
      s1 = Lipgloss::Style.new
      s2 = s1.border_top(true)

      # s1 should remain unchanged
      s1.border_top?.should be_false

      # s2 should have border top
      s2.border_top?.should be_true
    end

    it "reproduces the original issue correctly" do
      # Test the exact issue from the description
      focused_base = Lipgloss::Style.new
      blurred_base = Lipgloss::Style.new

      focused_base = focused_base.border_style(Lipgloss::Border.thick)
      blurred_base = focused_base.border_style(Lipgloss::Border.hidden)

      # focused_base should still have thick border
      focused_base.border_style.top.should eq("━")

      # blurred_base should have hidden border
      blurred_base.border_style.top.should eq(" ")
    end

    it "foreground returns a new Style" do
      s1 = Lipgloss::Style.new
      s2 = s1.foreground(Lipgloss::Color.hex("#ff0000"))

      # s1 should remain unchanged
      s1.foreground.should be_nil

      # s2 should have foreground color
      s2.foreground.should eq(Lipgloss::Color.hex("#ff0000"))
    end

    it "background returns a new Style" do
      s1 = Lipgloss::Style.new
      s2 = s1.background(Lipgloss::Color.hex("#00ff00"))

      # s1 should remain unchanged
      s1.background.should be_nil

      # s2 should have background color
      s2.background.should eq(Lipgloss::Color.hex("#00ff00"))
    end
  end
end
