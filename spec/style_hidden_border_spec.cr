require "./spec_helper"

module Lipgloss
  describe Style do
    describe "hidden border behavior" do
      it "renders spaces for hidden border with all sides enabled" do
        style = Style.new
          .border(Border.hidden)
          .border_top(true)
          .border_right(true)
          .border_bottom(true)
          .border_left(true)

        rendered = style.render("test")
        # Should render spaces around text
        rendered.should eq("      \n test \n      ")
        rendered.size.should eq(20) # Same as Go
      end

      it "renders space for hidden border with only left side enabled" do
        style = Style.new
          .border(Border.hidden)
          .border_left(true)
          .border_top(false)
          .border_right(false)
          .border_bottom(false)

        rendered = style.render("test")
        # Should render space before text
        rendered.should eq(" test")
        rendered.size.should eq(5) # Same as Go
      end

      it "has space characters for hidden border" do
        hidden = Border.hidden
        hidden.top.should eq(" ")
        hidden.left.should eq(" ")
        hidden.right.should eq(" ")
        hidden.bottom.should eq(" ")
        hidden.top.bytes[0].should eq(32) # ASCII space
      end

      it "matches Go output exactly for hidden border with all sides" do
        style = Style.new
          .border(Border.hidden)
          .border_top(true)
          .border_right(true)
          .border_bottom(true)
          .border_left(true)

        rendered = style.render("test")
        # Go output: '      \n test \n      ' (20 chars)
        # Note: Go prints with single quotes, actual string has newlines
        rendered.should eq("      \n test \n      ")
      end

      it "matches Go output exactly for hidden border with left side only" do
        style = Style.new
          .border(Border.hidden)
          .border_left(true)
          .border_top(false)
          .border_right(false)
          .border_bottom(false)

        rendered = style.render("test")
        # Go output: ' test' (5 chars)
        rendered.should eq(" test")
      end
    end
  end
end