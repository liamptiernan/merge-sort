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

p merge_sort(arr)