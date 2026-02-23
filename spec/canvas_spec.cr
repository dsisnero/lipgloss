require "./spec_helper"

describe "Lipgloss parity: Canvas" do
  it "renders drawn content" do
    canvas = Lipgloss::Canvas.new(5, 3)

    (0...canvas.height).each do |y|
      (0...canvas.width).each do |x|
        canvas.set_cell(x, y, Ultraviolet::Cell.new("."))
      end
    end

    (1...2).each do |y|
      (1...4).each do |x|
        canvas.set_cell(x, y, Ultraviolet::Cell.new("#"))
      end
    end

    expected = [
      ".....",
      ".###.",
      ".....",
    ].join("\n")

    canvas.render.should eq(expected)
  end

  it "trims trailing spaces on render" do
    canvas = Lipgloss::Canvas.new(5, 2)

    (0...canvas.height).each do |y|
      (0...canvas.width).each do |x|
        content = x < 3 ? "A" : " "
        canvas.set_cell(x, y, Ultraviolet::Cell.new(content))
      end
    end

    expected = [
      "AAA",
      "AAA",
    ].join("\n")

    canvas.render.should eq(expected)
  end

  it "updates canvas when setting a cell" do
    canvas = Lipgloss::Canvas.new(4, 1)
    cell = Ultraviolet::Cell.new("X", 1)
    canvas.set_cell(1, 0, cell)

    canvas.render.should eq(" X")
  end
end
