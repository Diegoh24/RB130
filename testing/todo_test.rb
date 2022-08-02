require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < MiniTest::Test
  attr_reader :todos, :list, :list, :todos

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
    assert_equal(todos, list.to_a)
  end

  def test_size
    assert_equal(3, list.size)
  end

  def test_first
    assert_equal(@todo1 , list.first)
  end

  def test_last
    assert_equal(todos.last, list.last)
  end

  def test_shift
    assert_equal(todos.shift, list.shift)
    assert_equal(todos, list.to_a)
  end

  def test_pop
    assert_equal(todos.pop, list.pop)
    assert_equal(todos, list.to_a)
  end

  def test_done?
    list.mark_all_undone
    assert_equal(list.done?, false)
    list.mark_all_done
    assert_equal(list.done?, true)
  end

  def test_add_type_error
    assert_raises(TypeError) { list.add('todo') }
  end

  def test_shovel_method
    list << todos.first
    assert_equal(list.size, todos.size + 1)
  end

  def test_add
    list.add(todos.first)
    assert_equal(list.size, todos.size + 1)
  end

  def test_item_at
    assert_equal(todos.first, list.item_at(0))
    assert_raises(IndexError) {list.item_at(4)}
  end

  def test_mark_done_at
    list.mark_done_at(0)
    assert_equal(true, list.first.done?)
    assert_raises(IndexError) {list.mark_done_at(3)}
  end

  def test_mark_undone_at
    list.mark_undone_at(0)
    assert_equal(false, list.first.done?)
    assert_raises(IndexError) {list.mark_undone_at(3)}
  end

  def test_done!
    list.done!
    assert_equal(true, list.done?)
  end

  def test_remove_at
    list.remove_at(0)
    assert_equal(list.size, todos.size - 1)
    assert_raises(IndexError) {list.remove_at(10)}
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    -----Today's Todos-----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, list.to_s)
  end

  def test_one_done_to_s
    list.first.done!

    output = <<~OUTPUT.chomp
    -----Today's Todos-----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, list.to_s)
  end

  def test_done_to_s
    list.done!

    output = <<~OUTPUT.chomp
    -----Today's Todos-----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, list.to_s)
  end

  def test_each
    assert_equal(list.each{}, list)

    counter = 0
    list.each do |todo|
      assert_equal(todo, todos[counter])
      counter += 1
    end
  end

  def test_select
    refute_same(list.select{}, list)

    list.mark_done_at(0)
    marked_done = list.select(&:done?)

    assert_equal(marked_done.size, 1)
  end

  def test_map
    copy = list.map(&:dup)
    refute_same(copy, list)

    assert_equal(list.to_s, copy.to_s)
  end

  def test_find_by_title
    assert_equal(list.first, list.find_by_title(list.first.title))
  end

  def test_all_done
    list.mark_all_undone
    assert_equal(0, list.all_done.size)
  end

  def test_all_not_done
    list.mark_all_done
    assert_equal(0, list.all_not_done.size)
  end
end