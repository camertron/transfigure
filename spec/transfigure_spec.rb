# frozen_string_literal: true

require "spec_helper"

describe "transfigure_into!" do
  class Foo
    def identify
      "foo"
    end
  end

  class Bar
    def identify
      "bar"
    end
  end

  it "dynamically changes the object's class" do
    obj = Foo.new
    expect(obj).to be_a(Foo)

    obj.transfigure_into!(Bar)
    expect(obj).to be_a(Bar)
  end

  it "ensures the object responds to the new class's methods" do
    obj = Foo.new
    expect(obj.identify).to eq("foo")

    obj.transfigure_into!(Bar)
    expect(obj.identify).to eq("bar")
  end
end
