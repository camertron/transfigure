# frozen_string_literal: true

require "transfigure"
require "benchmark/ips"

class Base
  def foo
    'foo'
  end
end

class MethodMissingWrapper
  def initialize(base)
    @base = base
  end

  def method_missing(mtd)
    @base.send(mtd).upcase
  end
end

class ClassEvalWrapper
  def initialize(base)
    @base = base
  end

  def method_missing(mtd, *)
    self.class.class_eval(<<~RUBY)
      def #{mtd}
        @base.#{mtd}.upcase
      end
    RUBY

    send(mtd)
  end
end

class Wrapper < Base
  def foo
    super.upcase
  end
end

base = Base.new
method_missing_wrapper = MethodMissingWrapper.new(base)
class_eval_wrapper = ClassEvalWrapper.new(base)
base2 = Base.new
base2.transfigure_into!(Wrapper)

Benchmark.ips do |x|
  x.report("method_missing") do
    method_missing_wrapper.foo
  end

  x.report("class_eval") do
    class_eval_wrapper.foo
  end

  x.report("transfigured") do
    base2.foo
  end

  x.compare!
end
