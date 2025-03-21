# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new [1, 2, 3]
  end

  def test_push_element
    @stack.push!(42)
    assert { @stack.to_a == [1, 2, 3, 42] }
  end

  def test_pop_element
    pop_el = @stack.pop!
    assert { pop_el == 3 }
    assert { @stack.to_a == [1, 2] }
  end

  def test_clear_stack
    @stack.clear!
    assert { @stack.to_a == [] }
  end

  def test_stack_is_not_empty_initially
    refute { @stack.empty? }
  end

  def test_stack_is_empty_after_clear
    @stack.clear!
    assert { @stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
