=begin

-define a custom data strcture

define your own set type
behaves like a set of unique elements can can be manipulated in several well defined ways.

all elements of a set are numbers (integers)

one class Customset, instantiates a set.

identify all the behaviors and seee how they intertwine

empty? call,

contains? check if set has the arg

subset? method
-tests the set to see if it is a subset of the argument
-every element in the set is the same as every element in the subset

disjoint?
-returns true if no elements in set match other_set
=end

class CustomSet
  attr_reader :set

  def initialize(new_set = [])
    @set = new_set
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include? num
  end

  def subset?(super_set)
    set.all? { |n| super_set.contains?(n) } || set.empty?
  end

  def disjoint?(other_set)
    set.none? { |n| other_set.contains?(n) }
  end

  def eql?(other_set)
    return false if !empty? && other_set.empty? || !other_set.empty? && empty?
    subset?(other_set) || other_set.subset?(self)
  end
  alias_method :==, :eql?

  def add(num)
    set << num
    self
  end

  def intersection(other_set)
    CustomSet.new(set.select { |num| other_set.contains?(num) })
  end

  def difference(other_set)
    CustomSet.new(set - other_set.set)
  end

  def union(other_set)
    CustomSet.new(set.union(other_set.set))
  end
end
