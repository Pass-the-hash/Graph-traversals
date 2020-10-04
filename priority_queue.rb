class PriorityQueue
  include Enumerable

  #attr_reader :items
  def initialize
    @items=[[], []]
  end

  def each(&block)
    @items[0].each &block
  end

  def empty?
    @items[0].empty?
  end


  def push(object, priority)
    if !@items[0].empty?
      if @items[1][-1] > priority
        @items[0] << object
        @items[1] << priority
      else
        @items[1].each_with_index do |item, index|
          if item > priority
            @items[0].insert index, item
            @items[1].insert index, priority
          end
        end
      end
    else
      @items[0] << object
      @items[1] << priority
    end

  end

  def pop
    @items[1].pop
    @items[0].pop unless @items[0].nil?
  end

  def size
    @items[0].size
  end

end
