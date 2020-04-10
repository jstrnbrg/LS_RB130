
require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_same(@todo1, @list.first)
  end

  def test_last
    assert_same(@todo3, @list.last)
  end

  def test_shift
    assert_same(@todo1, @list.shift) #check that returned object equals @todo1
    assert_equal(2, @list.size) #check that size of list is now 2
  end

  def test_pop
    assert_same(@todo3, @list.pop) #check that returned object equals @todo1
    assert_equal(2, @list.size) #check that size of list is now 2
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_TypeError
    assert_raises(TypeError) {@list.add("not a todo object")}
    assert_raises(TypeError) {@list.add(3)}
 end

 def test_shovel
   todo = Todo.new("Test task")
   @list << todo
   assert_equal(4, @list.size)
 end

 def test_add
   todo = Todo.new("Test task")
   @list.add(todo)
   assert_equal(4, @list.size)
 end

 def test_item_at
   assert_same(@todo1, @list.item_at(0))
   assert_raises(IndexError) {@list.item_at(20)}
 end

 def test_mark_done_at
   assert_raises(IndexError) {@list.mark_done_at(20)}
   @list.mark_done_at(2)
   assert_equal(false, @todo1.done?)
   assert_equal(false, @todo2.done?)
   assert_equal(true, @todo3.done?)
 end

 def test_mark_undone_at
   assert_raises(IndexError) {@list.mark_undone_at(20)}
   @list.done!
   @list.mark_undone_at(2)
   assert_equal(true, @todo1.done?)
   assert_equal(true, @todo2.done?)
   assert_equal(false, @todo3.done?)
 end

 def test_done!
   @list.done!
   assert_equal(true, @todo1.done?)
   assert_equal(true, @todo2.done?)
   assert_equal(true, @todo3.done?)
   assert_equal(true, @list.done?)
 end

 def test_remove_at
   assert_raises(IndexError) {@list.remove_at(20)}
   @list.remove_at(1)
   assert_equal([@todo1, @todo3], @list.to_a)
 end

 def test_each
   result = []
   @list.each { |todo| result << todo }
   assert_equal([@todo1, @todo2, @todo3], result)
 end

 def test_each_return
   assert_same(@list, @list.each {|x| nil})
 end

 def test_select
   new = TodoList.new(@list.title)
   new.add(@todo2)
   assert_equal(new.title, @list.title)
   assert_equal(new.to_s, @list.select {|item| item.title == "Clean room" }.to_s)
 end

 def test_all_done
   @list.mark_done_at(1)
   assert_equal([@todo2], @list.all_done.to_a)
 end

 def test_all_not_done
   @list.mark_done_at(1)
   assert_equal([@todo1, @todo3], @list.all_not_done.to_a)
 end

 def test_mark_all_done!
   @list.mark_all_done!
   assert_equal([], @list.all_not_done.to_a)
 end
end
