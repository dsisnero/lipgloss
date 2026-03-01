require "./spec_helper"

describe "Lipgloss parity: StyleRunes" do
  it "styles selected rune indices" do
    matched = Lipgloss::Style.new.reverse(true)
    unmatched = Lipgloss::Style.new

    cases = [
      {name: "hello 0", input: "hello", indices: [0], expected: "\e[7mh\e[mello"},
      {name: "你好 1", input: "你好", indices: [1], expected: "你\e[7m好\e[m"},
      {name: "hello 你好 6,7", input: "hello 你好", indices: [6, 7], expected: "hello \e[7m你好\e[m"},
      {name: "hello 1,3", input: "hello", indices: [1, 3], expected: "h\e[7me\e[ml\e[7ml\e[mo"},
      {name: "你好 0,1", input: "你好", indices: [0, 1], expected: "\e[7m你好\e[m"},
    ]

    cases.each do |test_case|
      Lipgloss.style_runes(test_case[:input], test_case[:indices], matched, unmatched).should eq(test_case[:expected]), test_case[:name]
    end
  end
end
