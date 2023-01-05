# ref: https://leetcode.com/problems/kth-largest-element-in-a-stream/discuss/1172853/Ruby-Faster-100
class KthLargestWithNoHeap

  # :type k: Integer
  # :type nums: Integer[]
  def initialize(k, nums)
    @max_size = k
    @data = nums.sort.reverse[0...k]
  end

  # :type val: Integer
  # :rtype: Integer
  def add(val)
    if (i = @data.bsearch_index { |x| x < val })
      @data.insert(i, val)
    else
      @data.push(val)
    end
    @data.pop if @data.length > @max_size
    @data.last
  end
end

#
# Algorithms gemのMinHeapを使うとTLEになるので自前のMinHeapで
#
# Runtime: 383 ms, faster than 33.33% of Ruby online submissions for Kth Largest Element in a Stream.
# Memory Usage: 214.5 MB, less than 8.33% of Ruby online submissions for Kth Largest Element in a Stream.
class KthLargest

  # :type k: Integer
  # :type nums: Integer[]
  def initialize(k, nums)
    @max_size = k
    @heap = Heap.new
    nums.each do |n|
      @heap.push(n)
    end
    while @heap.size > @max_size
      @heap.pop
    end
  end

  # :type val: Integer
  # :rtype: Integer
  def add(val)
    @heap.push(val)
    @heap.pop if @heap.size > @max_size

    @heap.min
  end
end

# 配列を使った最小ヒープを実装
# ヒープの各要素には値と付随する情報を保持することが可能
class Heap
  def initialize
    @array = []
    # 配列の要素は配列
    # 要素の最初の要素が値
    # @array => [[1], [2], [3]]
    # @array => [[1, 'key1'], [2, 'key2'], [3, 'key3']]
  end

  def size
    @array.size
  end

  def min
    top
  end

  def top
    min = @array.first
    min.size == 1 ? min[0] : min
  end

  def push(item)
    item.instance_of?(Array) ? @array.push(item) : @array.push([item])

    current_index = @array.size - 1

    # 末尾から木の再構築
    rebuild_bottom_to_top(current_index)
  end

  def pop
    # 配列の先頭がヒープのルートノード（最小値）なので、それを返すために保持
    min = @array.shift

    return nil if min.nil? # 要素がない場合はnilを返す

    # ヒープを再構築
    rebuild_top_to_bottom

    # 再構築が終わってから返す
    min.size == 1 ? min[0] : min
  end

  private

  # ヒープからpopしたときは末尾の値を先頭に移動して、そこから再構築
  def rebuild_top_to_bottom
    # 要素がない場合は再構築の必要なし
    return if @array.empty?

    # 先頭に末尾の値を持ってくる
    @array.unshift(@array.pop)

    current_index = 0

    Kernel.loop do
      left_child_index, right_child_index = child_indexes_for(current_index)

      # 左側の子がなければそれ以上子はいないので再構築終了
      break if @array[left_child_index].nil?

      # 左右の子のより小さい方を入れ替え候補に
      smaller_child_index =
        pick_smaller_child_index(left_child_index, right_child_index)

      # 子の方が小さければ入れ替え 入れ替えがなければ終了
      break if @array[smaller_child_index][0] >= @array[current_index][0]

      switch_item(current_index, smaller_child_index)
      current_index = smaller_child_index # インデックスの位置も更新
    end
  end

  def pick_smaller_child_index(left_child_index, right_child_index)
    if !@array[right_child_index].nil? &&
       @array[right_child_index][0] < @array[left_child_index][0]
      right_child_index
    else
      left_child_index
    end
  end

  # ヒープにpushしたときは追加された値を末尾に置いて、そこから再構築
  def rebuild_bottom_to_top(current_index)
    Kernel.loop do
      break if current_index.zero?

      # 親と値を比較して、親の方が大きければ親と位置を入れ替える
      parent_index = parent_index_for(current_index)
      # p "current_index: #{current_index}, #{@array[current_index][0]}"
      # p "parent_index: #{parent_index}, #{@array[parent_index][0]}"

      # 入れ替えがなければ再構築終了
      break if @array[current_index][0] >= @array[parent_index][0]

      switch_item(current_index, parent_index)
      current_index = parent_index # インデックスの位置も更新
    end
  end

  def parent_index_for(current_index)
    (current_index - 1) / 2
    # 0 => -1
    # 1 -> 0 => 3, 4
    # 2 -> 0 => 5, 6
    # 3 -> 1 => 7, 8
    # 4 -> 1 => 9, 10
    # 5 -> 2
    # 6 -> 2
    # 7 -> 3
    # 8 -> 3
  end

  def child_indexes_for(current_index)
    left_index = current_index * 2 + 1
    right_index = current_index * 2 + 2

    [left_index, right_index]
  end

  def switch_item(index1, index2)
    @array[index1], @array[index2] = @array[index2], @array[index1]
  end
end

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)
obj = KthLargest.new(3, [4, 5, 8, 2])
p obj.add(3) #=> 4 [8, 5, 4, 3, 2]
p obj.add(5) #=> 5 [8, 5, 5, 4, 3, 2]
p obj.add(10) #=> 5
p obj.add(9) #=> 8
p obj.add(4) #=> 8

obj = KthLargest.new(1, [])
p obj.add(-3)

obj = KthLargest.new(2, [0])
p obj.add(-1)
