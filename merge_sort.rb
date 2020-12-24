require 'pry'

def merge_sort (array)
    if array.length < 2
        return array
    else

        left_half = merge_sort(array[0..(array.length-1)/2])
        right_half = merge_sort(array[((array.length-1)/2)+1..-1])

        sorted = []
        left_half.each do |x|
            until right_half.length == 0 || x < right_half[0]
                sorted << right_half[0]
                right_half = right_half.drop(1)
                if right_half.length == 0
                    break
                end
            end
            sorted << x
        end
        if right_half.length>0
            right_half.each do |x|
                sorted << x
            end
        end
        return sorted
    end
end

arr = []
rand(200).times do
  arr << rand(200)
end

sorted = merge_sort(arr)
p sorted

def binary_search(array,target)

    start = 0
    arr_end = array.length-1
    midpoint = (arr_end + start)/2
    binding.pry
    while true
        if arr_end-start < 0
            return false
            break
        elsif array[midpoint] == target
            return midpoint
            break
        elsif array[midpoint] > target
            arr_end = midpoint-1
            midpoint = (arr_end + start)/2
        elsif array[midpoint] < target
            start = midpoint+1
            midpoint = (arr_end + start)/2
        end
    end
end

sample = arr.sample
p sample
p binary_search(sorted,sample)