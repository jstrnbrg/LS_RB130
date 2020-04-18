require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

NoExperienceError = Class.new(StandardError)

class Employee
  def hire
    raise NoExperienceError
  end
end

class List
  def process
    12
  end
end

class Tests < MiniTest::Test
  def setup
  end

  def test_boolean
    value = 5
    #assert_equal(true, value.odd?)
    assert(value.odd?, 'value is not odd') #Most (but not all) of the minitest assertions let you specify a failure message as the final argument.
  end

  def test_equality_1
     value = "XYZ"
     assert_equal("xyz", value.downcase)
   end

   def test_equality_2
     value = "ABC"
     assert_equal("xyz", value.downcase)
   end

   def test_nil
     value = 1
     assert_nil(value)
   end

   def test_empty_object
     list = [1,2,3]
     assert_empty(list)
   end

   def test_include
     list = [1,2,3]
     assert_includes(list, 'xzy')
   end

   def test_exception
     employee = 2
     assert_raises(NoExperienceError) {employee.hire}
   end

   def test_instance_of
     value = 2
     assert_instance_of(Numeric, value)
   end

   def test_instance_of_weak
     value = "a"
     assert_kind_of(Numeric, value)
   end

   def test_same_object
     list = List.new()
     assert_same(list, list.process)
   end

   def test_refute_in_list
     list = ["abc", "def", "xyz"]
     refute_includes(list, "xyz")
   end
end
