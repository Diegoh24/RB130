=begin
the linked list is a fundamental data structure in comp sci
often used in the implementation of other data structure

singly linked list
each element in the list contains data and a 'next' field
pointing to the next element in the list of elements.
This variant of linked list is often used to represent sequences or
push-down stacks (last in first out)

- create a singly linked list whose elements may contain a range of data such
as the numbers 1-10. Prove the funcitons to reverse the linked list and convert a linked list
to and from an array.





constructor (one int arg)

instance method datum??
instance method tail? (is there an element in the list.

instnace method push(int), pushes an element to the list.

class method 'from_a

instance method 'next' - is 1, retrieves element at idx.


first in first out..

=end


class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_elem = @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
  end

  def peek
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []
    current_elem = head
    while !current_elem.nil?
      array.push(current_elem.datum)
      current_elem = current_elem.next
    end
    array
  end

  def reverse
    list = SimpleLinkedList.new
    current_elem = head
    while !current_elem.nil?
      list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    list
  end
end

