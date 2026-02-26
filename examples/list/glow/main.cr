require "../../../src/lipgloss"

record Document, name : String, time : String do
  def to_s(io : IO) : Nil
    io << name << '\n' << Lipgloss::Style.new.faint.render(time)
  end
end

docs = [
  Document.new("README.md", "2 minutes ago"),
  Document.new("Example.md", "1 hour ago"),
  Document.new("secrets.md", "1 week ago"),
]

selected = 1
base_style = Lipgloss::Style.new.margin_bottom(1).margin_left(1)
dim_color = Lipgloss::Color.indexed(250)
highlight_color = Lipgloss::Color.from_hex("#EE6FF8")

list = Lipgloss::List.new
  .enumerator(->(_items : Lipgloss::List::Items, i : Int32) { i == selected ? "│\n│" : " " })
  .item_style_func(->(_items : Lipgloss::List::Items, i : Int32) { i == selected ? base_style.copy.foreground(highlight_color) : base_style.copy.foreground(dim_color) })
  .enumerator_style_func(->(_items : Lipgloss::List::Items, i : Int32) { i == selected ? Lipgloss::Style.new.foreground(highlight_color) : Lipgloss::Style.new.foreground(dim_color) })

docs.each { |doc| list.item(doc.to_s) }
puts "\n#{list}\n"
