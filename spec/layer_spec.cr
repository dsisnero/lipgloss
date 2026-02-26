require "./spec_helper"

describe "Lipgloss parity: Layer" do
  it "constructs a leaf layer with only content" do
    layer = Lipgloss::Layer.new("leaf")

    layer.content.should eq("leaf")
    layer.get_content.should eq("leaf")
    layer.width.should eq(Lipgloss.width("leaf"))
    layer.height.should eq(Lipgloss.height("leaf"))
    layer.layers.should eq([] of Lipgloss::Layer)
  end

  it "constructs a leaf layer via helper" do
    layer = Lipgloss.new_layer("leaf")

    layer.content.should eq("leaf")
    layer.width.should eq(Lipgloss.width("leaf"))
    layer.height.should eq(Lipgloss.height("leaf"))
  end

  it "exposes layer get_* coordinate/id wrappers" do
    layer = Lipgloss::Layer.new("node").id("root").x(3).y(4).z(5)

    layer.get_id.should eq("root")
    layer.get_x.should eq(3)
    layer.get_y.should eq(4)
    layer.get_z.should eq(5)
  end

  it "constructs an empty compositor" do
    compositor = Lipgloss::Compositor.new

    compositor.bounds.should eq(Lipgloss::Rectangle.from_xywh(0, 0, Lipgloss.width(""), Lipgloss.height("")))
    compositor.render.should eq("")
  end

  it "constructs an empty compositor via helper" do
    compositor = Lipgloss.new_compositor

    compositor.bounds.should eq(Lipgloss::Rectangle.from_xywh(0, 0, Lipgloss.width(""), Lipgloss.height("")))
    compositor.render.should eq("")
  end
end
