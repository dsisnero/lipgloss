require "../../../../src/lipgloss"

# Static variant of the upstream Bubble Tea border-blend rotation example.
offsets = [0, 15, 30]

offsets.each do |offset|
  puts Lipgloss::Style.new
    .border(Lipgloss::Border.rounded)
    .border_top_foreground(Lipgloss::Color.from_hex("#00FA68"))
    .border_right_foreground(Lipgloss::Color.from_hex("#00FA68"))
    .border_bottom_foreground(Lipgloss::Color.from_hex("#00FA68"))
    .border_left_foreground(Lipgloss::Color.from_hex("#00FA68"))
    .width(60)
    .height(5)
    .render("Border blend offset: #{offset}")
  puts
end
