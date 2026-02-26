require "../../../../src/lipgloss"

# Static variant of the upstream Bubble Tea Blend1D gradient demo.
record Gradient, name : String, stops : Array(Lipgloss::Color)

gradients = [
  Gradient.new("Sunset", [Lipgloss::Color.from_hex("#FF6B6B"), Lipgloss::Color.from_hex("#FFB74D"), Lipgloss::Color.from_hex("#FFDFBA")]),
  Gradient.new("Ocean", [Lipgloss::Color.from_hex("#0077B6"), Lipgloss::Color.from_hex("#48CAE4"), Lipgloss::Color.from_hex("#ADE8F4")]),
  Gradient.new("Forest", [Lipgloss::Color.from_hex("#228B22"), Lipgloss::Color.from_hex("#90EE90"), Lipgloss::Color.from_hex("#FFFFE0")]),
]

puts Lipgloss::Style.new.bold.render("Color Gradient Examples with Blend1D")
puts

gradients.each do |gradient|
  print Lipgloss::Style.new.bold.width(12).render(gradient.name)
  blended = Lipgloss.blend1d(60, gradient.stops[0], gradient.stops[1], gradient.stops[2])
  next unless blended
  blended.each do |color|
    print Lipgloss::Style.new.background(Lipgloss::Color.rgb(color.r, color.g, color.b)).render(" ")
  end
  puts
end
