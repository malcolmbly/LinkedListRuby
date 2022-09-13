class LinkedList 

  class Node 
    attr_accessor :value, :next

    def initialize (value, next_node)
      @value = value
      @next = next_node
    end
  end

  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value, nil)
    if @size.zero?
      @head = node
    else
      @tail.next = node
    end
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = Node.new(value, @head)
    @tail = node if @size.zero?
    @head = node
    @size += 1
  end

  def at(index)
    raise IndexError.new('Cannot access index outside of linked list bounds.') if index >= @size

    current_node = @head
    index.times do
      current_node = current_node.next
    end
    current_node
  end

  def pop
    each do |n|
      if n.next == @tail
        node = @tail
        @tail = n
        n.next = nil
        @size -= 1
        return node
      end
      next
    end
  end

  def each
    node = @head
    until node.nil?
      yield node
      node = node.next
    end
    self
  end

  def each_with_index
    node = @head
    i = 0
    until node.nil?
      yield node, i
      node = node.next
      i += 1
    end
    self
  end

  def contains?(value)
    each { |n| return true if n.value == value }
    false
  end

  def find(value)
    each_with_index { |n, idx| return idx if n.value == value }
    nil
  end

  def to_s
    string = ""
    each { |n| string += "( #{n.value} ) -> " }
    string += 'nil'
  end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.append(4)
p list.pop
# p list.pop
# p list.at(0)
list.append(7)
# p list.contains?(7)
# p list.contains?(8)
p list.find(3)
puts list
