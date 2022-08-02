# def bubble_sort!(arr)
#   loop do
#     swap = false
#       (arr.size - 1).times do |n|
#         if arr[n] > arr[n + 1]
#           swap_em(arr, n)
#           swap = true
#         end
#       end
#       break if !swap
#   end
# end

def bubble_sort!(arr)
  loop do
    swap = false
    (arr.size - 1).times do |idx|
      if block_given? && !yield(arr[idx], arr[idx + 1])
        swap_em(arr, idx)
        swap = true
      elsif !block_given? && arr[idx] > arr[idx + 1]
        swap_em(arr, idx)
        swap = true
      end
    end

    break unless swap
  end
end


def swap_em(arr, n)
  arr[n], arr[n + 1] = arr[n + 1], arr[n]
end

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)