require "../../../src/lipgloss"

# Static variant of upstream compat/adaptive example using Lipgloss::Compat.
frame_color = Lipgloss::Compat::AdaptiveColor.new(
  Lipgloss::Color.from_hex("#C5ADF9"),
  Lipgloss::Color.from_hex("#864EFF")
)
text_color = Lipgloss::Compat::AdaptiveColor.new(
  Lipgloss::Color.from_hex("#696969"),
  Lipgloss::Color.from_hex("#bdbdbd")
)
keyword_color = Lipgloss::Compat::AdaptiveColor.new(
  Lipgloss::Color.from_hex("#37CD96"),
  Lipgloss::Color.from_hex("#22C78A")
)

frame = Lipgloss::Style.new
  .border(Lipgloss::Border.rounded)
  .border_top_foreground(frame_color.resolve)
  .border_right_foreground(frame_color.resolve)
  .border_bottom_foreground(frame_color.resolve)
  .border_left_foreground(frame_color.resolve)
  .padding(1, 3)
text = Lipgloss::Style.new.foreground(text_color.resolve)
keyword = Lipgloss::Style.new.bold.foreground(keyword_color.resolve)

puts frame.render(
  text.render("Are you sure you want to eat that ") +
  keyword.render("moderatly ripe") +
  text.render(" banana?")
)
