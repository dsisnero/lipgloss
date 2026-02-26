require "colorprofile"

module Lipgloss
  private def self.environ : Array(String)
    ENV.map { |k, v| "#{k}=#{v}" }
  end

  # Writer that can be either a plain IO or a Colorprofile::Writer
  # This allows tests to use IO::Memory while production code uses Colorprofile::Writer
  # Default writer automatically detects color profile like Go lipgloss
  @@writer : IO | Colorprofile::Writer = Colorprofile.new_writer(STDOUT, environ)

  def self.writer : IO | Colorprofile::Writer
    @@writer
  end

  def self.writer=(w : IO | Colorprofile::Writer)
    @@writer = w
  end

  # Get the color profile from the writer (if it's a Colorprofile::Writer)
  private def self.writer_profile : Colorprofile::Profile
    w = writer
    case w
    when Colorprofile::Writer
      w.profile
    else
      # Default to TrueColor if writer is plain IO
      Colorprofile::Profile::TrueColor
    end
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
    writer = Colorprofile.new_writer(io, environ)
    bytes = writer.write_string(value).to_i32
    {bytes, nil}
  end

  def self.fprintln(io : IO, *args) : {Int32, Nil}
    value = stringify_line_args(args.to_a) + "\n"
    writer = Colorprofile.new_writer(io, environ)
    bytes = writer.write_string(value).to_i32
    {bytes, nil}
  end

  def self.fprintf(io : IO, format : String, *args) : {Int32, Nil}
    value = format % args.to_a
    writer = Colorprofile.new_writer(io, environ)
    bytes = writer.write_string(value).to_i32
    {bytes, nil}
  end

  def self.sprint(*args) : String
    buffer = IO::Memory.new
    profile = writer_profile
    writer = Colorprofile::Writer.new(buffer, profile)
    value = stringify_args(args.to_a)
    writer.write_string(value)
    buffer.to_s
  end

  def self.sprintln(*args) : String
    buffer = IO::Memory.new
    profile = writer_profile
    writer = Colorprofile::Writer.new(buffer, profile)
    value = stringify_line_args(args.to_a) + "\n"
    writer.write_string(value)
    buffer.to_s
  end

  def self.sprintf(format : String, *args) : String
    buffer = IO::Memory.new
    profile = writer_profile
    writer = Colorprofile::Writer.new(buffer, profile)
    value = format % args.to_a
    writer.write_string(value)
    buffer.to_s
  end
end
