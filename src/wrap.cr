require "ansi"
require "ultraviolet"

module Lipgloss
  # WrapWriter is a writer that writes to a buffer and keeps track of the
  # current pen style and link state for the purpose of wrapping with newlines.
  #
  # When it encounters a newline, it resets the style and link, writes the
  # newline, and then reapplies the style and link to the next line.
  class WrapWriter
    @io : IO
    @parser : Ansi::Parser?
    @style : Ultraviolet::Style
    @link : Ultraviolet::Link

    # Returns a new WrapWriter.
    def initialize(@io : IO)
      @style = Ultraviolet::Style.new
      @link = Ultraviolet::Link.new
      parser = Ansi.get_parser
      @parser = parser
      handle_csi = ->(cmd : Ansi::Cmd, params : Ansi::Params) do
        if cmd == 'm'.ord
          @style = Ultraviolet.read_style_from_params(params, @style)
        end
      end
      handle_osc = ->(cmd : Int32, data : Bytes) do
        if cmd == 8
          @link = Ultraviolet.read_link_from_data(data, @link)
        end
      end
      parser.set_handler(Ansi::Handler.new(
        handle_csi: handle_csi,
        handle_osc: handle_osc
      ))
    end

    # Returns the current pen style.
    def style : Ultraviolet::Style
      @style
    end

    # Returns the current pen link.
    def link : Ultraviolet::Link
      @link
    end

    # Write writes to the buffer.
    def write(p : Bytes) : Int32
      parser = @parser.not_nil!
      p.each do |b|
        parser.advance(b)
        if b == '\n'.ord
          unless @style.zero?
            @io << Ansi::ResetStyle
          end
          unless @link.empty?
            @io << Ansi.reset_hyperlink
          end
        end

        @io.write_byte(b)

        if b == '\n'.ord
          unless @link.empty?
            @io << Ansi.set_hyperlink(@link.url, @link.params)
          end
          unless @style.zero?
            @io << @style.string
          end
        end
      end
      p.size
    end

    # Write writes a string to the buffer.
    def write(s : String) : Int32
      write(s.to_slice)
    end

    # Close closes the writer, resets the style and link if necessary, and releases
    # its parser. Calling it is performance critical, but forgetting it does not
    # cause safety issues or leaks.
    def close : Nil
      unless @style.zero?
        @io << Ansi::ResetStyle
      end
      unless @link.empty?
        @io << Ansi.reset_hyperlink
      end
      if parser = @parser
        Ansi.put_parser(parser)
        @parser = nil
      end
    end
  end

  # Wrap wraps the given string to the given width, preserving ANSI styles and links.
  def self.wrap(s : String, width : Int32, breakpoints : String = "") : String
    wrapped = Ansi.wrap(s, width, breakpoints)
    io = IO::Memory.new
    w = WrapWriter.new(io)
    w.write(wrapped)
    w.close
    io.to_s
  end
end
