require "colorprofile"

module Lipgloss
  # Writer that can be either a plain IO or a Colorprofile::Writer
  # This allows tests to use IO::Memory while production code uses Colorprofile::Writer
  @@writer : IO | Colorprofile::Writer = Colorprofile::Writer.new(STDOUT, Colorprofile::Profile::TrueColor)

  def self.writer : IO | Colorprofile::Writer
    @@writer
  end

  def self.writer=(w : IO | Colorprofile::Writer)
    @@writer = w
  end

  # Helper to write to either IO or Colorprofile::Writer
  private def self.write_to(io : IO | Colorprofile::Writer, value : String) : Nil
    case io
    when Colorprofile::Writer
      io.write_string(value)
    else
      io << value
    end
  end

  private def self.stringify_args(args : Array) : String
    String.build do |io|
      args.each { |arg| io << arg }
    end
  end

  private def self.stringify_line_args(args : Array) : String
    args.map(&.to_s).join(" ")
  end

  def self.print(*args) : {Int32, Nil}
    value = stringify_args(args.to_a)
    write_to(writer, value)
    {value.bytesize, nil}
  end

  def self.println(*args) : {Int32, Nil}
    value = stringify_line_args(args.to_a) + "\n"
    write_to(writer, value)
    {value.bytesize, nil}
  end

  def self.printf(format : String, *args) : {Int32, Nil}
    value = format % args.to_a
    write_to(writer, value)
    {value.bytesize, nil}
  end

  def self.fprint(io : IO, *args) : {Int32, Nil}
    value = stringify_args(args.to_a)
    io << value
    {value.bytesize, nil}
  end

  def self.fprintln(io : IO, *args) : {Int32, Nil}
    value = stringify_line_args(args.to_a) + "\n"
    io << value
    {value.bytesize, nil}
  end

  def self.fprintf(io : IO, format : String, *args) : {Int32, Nil}
    value = format % args.to_a
    io << value
    {value.bytesize, nil}
  end

  def self.sprint(*args) : String
    stringify_args(args.to_a)
  end

  def self.sprintln(*args) : String
    stringify_line_args(args.to_a) + "\n"
  end

  def self.sprintf(format : String, *args) : String
    format % args.to_a
  end
end
