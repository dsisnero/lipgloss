require "cellwrap"
require "uniwidth"
require "textseg"

require "./view"
require "./color_profile"
require "./renderer"
require "./geometry"
require "./canvas"
require "./layer"
require "./style"
require "./join"
require "./range"
require "./style_table"

module Lipgloss
  VERSION = "2.0.0-exp"

  # Gets the first UTF-8 rune from a string.
  def self.get_first_rune_as_string(str : String) : String
    return "" if str.empty?
    str[0].to_s
  end
end
