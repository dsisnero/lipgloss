require "../../../../src/lipgloss"

# Static variant of the upstream Bubble Tea Blend2D demo.
stops = [
  Lipgloss::Color.from_hex("#9900FF"),
  Lipgloss::Color.from_hex("#00FA68"),
  Lipgloss::Color.from_hex("#ED5353"),
]

width = 32
height = 12
angle = 45.0

gradient = Lipgloss.blend2d(width, height, angle, stops[0], stops[1], stops[2])
if gradient
  rows = String.build do |io|
    height.times do |y|
      width.times do |x|
        index = y * width + x
        c = gradient[index]
        io << Lipgloss::Style.new.background(Lipgloss::Color.rgb(c.r, c.g, c.b)).render(" ")
      end
      io << '\n' if y < height - 1
    end
  end

  puts Lipgloss::Style.new
    .border(Lipgloss::Border.rounded)
    .padding(0, 1)
    .render(rows)
end
