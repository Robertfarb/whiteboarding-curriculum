class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return if length <= 1 
    pivot = self.partition(array, start, length, & prc)

    left = self.sort2!(array, start, pivot - start, &prc)
    right = self.sort2!(array, pivot + 1, length - pivot - 1, & prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{|x, y| x <=> y}
    pivot_idx = start + rand(length)
    array[pivot_idx], array[start] = array[start], array[pivot_idx]
    pivot_idx = start + 1
    idx = start + 1
    while idx < start + length
      if prc.call(array[start], array[idx]) == 1
        array[pivot_idx], array[idx] = array[idx], array[pivot_idx]
        pivot_idx += 1
      end
      idx += 1
    end
    pivot_idx -= 1
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end
end
