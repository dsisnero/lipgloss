require "./spec_helper"

module Lipgloss
  describe Style do
    describe "#border_top, #border_right, #border_bottom, #border_left" do
      it "sets individual border sides without affecting border type" do
        style = Style.new
          .border_top(true)
          .border_right(true)
          .border_bottom(true)
          .border_left(true)

        # Border sides should be enabled
        style.border_top?.should be_true
        style.border_right?.should be_true
        style.border_bottom?.should be_true
        style.border_left?.should be_true

        # But border type should be empty (no characters)
        border_tuple = style.border
        border_tuple[0].top.should eq("")
        border_tuple[0].left.should eq("")
        
        # Without border characters, nothing renders
        style.render("test").should eq("test")
      end

      it "shows borders when border type is set after individual sides" do
        style = Style.new
          .border_top(true)
          .border_right(true)
          .border_bottom(true)
          .border_left(true)
          .border(Border.normal)

        style.border_top?.should be_true
        style.border_left?.should be_true
        rendered = style.render("test")
        rendered.should contain("┌")
        rendered.should contain("┐")
        rendered.should contain("└")
        rendered.should contain("┘")
        rendered.should contain("│")
        rendered.should contain("─")
      end

      it "shows borders when border type is set before individual sides" do
        style = Style.new
          .border(Border.normal)
          .border_top(true)
          .border_right(true)
          .border_bottom(true)
          .border_left(true)

        style.border_top?.should be_true
        style.border_left?.should be_true
        rendered = style.render("test")
        rendered.should contain("┌")
        rendered.should contain("┐")
        rendered.should contain("└")
        rendered.should contain("┘")
      end

      it "enables all border sides by default when setting border type" do
        style = Style.new.border(Border.normal)
        style.border_top?.should be_true
        style.border_right?.should be_true
        style.border_bottom?.should be_true
        style.border_left?.should be_true
        
        rendered = style.render("test")
        rendered.should contain("┌")
        rendered.should contain("┐")
        rendered.should contain("└")
        rendered.should contain("┘")
      end

      it "has all border sides disabled by default for new style" do
        style = Style.new
        style.border_top?.should be_false
        style.border_right?.should be_false
        style.border_bottom?.should be_false
        style.border_left?.should be_false
      end

      it "returns a copy without modifying original (value semantics)" do
        original = Style.new.border(Border.normal)
        modified = original.border_left(false)

        original.border_left?.should be_true
        modified.border_left?.should be_false
        
        # Should render differently
        original_rendered = original.render("test")
        modified_rendered = modified.render("test")
        
        # Original has left border (first character after newline is "│")
        original_rendered.should contain("│")
        
        # Modified should not have left border but still has right border
        # The output is: "────┐\ntest│\n────┘"
        # No left border, but right border is still there
        modified_rendered.should contain("test│") # Right border
        modified_rendered.should_not contain("│test") # No left border
      end

      it "allows disabling specific border sides" do
        style = Style.new
          .border(Border.normal)
          .border_left(false)
          .border_top(false)

        style.border_left?.should be_false
        style.border_top?.should be_false
        style.border_right?.should be_true
        style.border_bottom?.should be_true

        rendered = style.render("test")
        # Should have right and bottom borders but not left or top
        # Output is: "test│\n────┘"
        rendered.should contain("┘") # bottom-right corner
        rendered.should_not contain("┌") # top-left corner
        rendered.should_not contain("└") # bottom-left corner
        rendered.should_not contain("┐") # top-right corner (no top border)
        rendered.should contain("│") # right border
        rendered.should contain("─") # bottom border
      end
    end
  end
end