require "../../../src/lipgloss"

# Static variant of upstream adaptive-color prompt.
is_dark = Lipgloss.has_dark_background?

frame = Lipgloss::Style.new
  .border(Lipgloss::Border.rounded)
  .border_top_foreground(is_dark ? Lipgloss::Color.from_hex("#864EFF") : Lipgloss::Color.from_hex("#C5ADF9"))
  .border_right_foreground(is_dark ? Lipgloss::Color.from_hex("#864EFF") : Lipgloss::Color.from_hex("#C5ADF9"))
  .border_bottom_foreground(is_dark ? Lipgloss::Color.from_hex("#864EFF") : Lipgloss::Color.from_hex("#C5ADF9"))
  .border_left_foreground(is_dark ? Lipgloss::Color.from_hex("#864EFF") : Lipgloss::Color.from_hex("#C5ADF9"))
  .padding(1, 3)

text = Lipgloss::Style.new
  .foreground(is_dark ? Lipgloss::Color.from_hex("#bdbdbd") : Lipgloss::Color.from_hex("#696969"))

keyword = Lipgloss::Style.new
  .bold
  .foreground(is_dark ? Lipgloss::Color.from_hex("#22C78A") : Lipgloss::Color.from_hex("#37CD96"))

puts frame.render(
  text.render("Are you sure you want to eat that ") +
  keyword.render("moderatly ripe") +
  text.render(" banana?")
)
