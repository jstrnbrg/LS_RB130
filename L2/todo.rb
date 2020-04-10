class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(item)
    if item.class == Todo
      @todos << item
    else
      raise TypeError.new("Can only add Todo objects")
    end
  end
  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos
  end

  def done?
    @todos.all? {|item| item.done? }
  end

  def done!
    @todos.each_index {|idx| mark_done_at(idx) }
  end

  def item_at(i)
    @todos.fetch(i)
  end

  def mark_done_at(i)
    item_at(i).done!
  end

  def mark_undone_at(i)
    item_at(i).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(i)
    @todos.delete(item_at(i))
  end

  def to_s
    @todos.each {|item| puts item }
  end

  def each
    @todos.each do |item|
      yield(item)
    end
    self
  end

  def select
    list = TodoList.new(title)
    self.each do |item|
      list.add(item) if !!yield(item)
    end
    list
  end

  # def find_by_title(title)
  #   self.select do |item|
  #     item
  #   end
  # end

  def mark_all_done!
    self.each { |todo| todo.done! }
  end

  def mark_all_undone!
    self.each { |todo| todo.undone! }
  end

  def all_done
    self.select { |item| item.done? }
  end

  def all_not_done
     self.select { |todo| !todo.done? }
  end

  def find_by_title(title)
    self.select { |todo| todo.title == title }.first
  end

  def mark_done(str)
    find_by_title(str).done!
  end

  # rest of class needs implementation

end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"
#list.to_s
# <<
# same behavior as add

# ---- Interrogating the list -----

# # size
# p list.size                       # returns 3
#
# # first
# puts list.first                      # returns todo1, which is the first item in the list
#
# # last
# puts list.last                       # returns todo3, which is the last item in the list
#
# #to_a
# puts list.to_a                      # returns an array of all items in the list
#
# # #done?
# p list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----
#
# # item_at
#list.item_at                    # raises ArgumentError
# puts list.item_at(1)                 # returns 2nd item in list (zero based index)
#list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----
#
# # mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError
#
#list.to_s
# # mark_undone_at
#list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError
#
#list.to_s
# # done!
list.done!                      # marks all items as done
#
#list.to_s
# # ---- Deleting from the list -----
#
# # shift
#list.shift                      # removes and returns the first item in list
#
# # pop
#list.pop                        # removes and returns the last item in list
#
#list.to_s
# # remove_at
#list.remove_at                  # raises ArgumentError
#list.remove_at(0)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError
#
#list.to_s
# # ---- Outputting the list -----
#
# # to_s
list.mark_all_undone!

#list.to_s

# returned = list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end


#list.mark_undone_at(1)
#list.mark_all_done!
#list.to_s

#
# results = list.select { |todo| todo.done? }    # you need to implement this method
# p results
#list.mark_undone_at(1)
#list = list.all_not_done
#p list

#p list.find_by_title("Clean room")
list.mark_done("Clean room")
#list.to_s
