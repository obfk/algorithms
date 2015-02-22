require 'benchmark'

list = (1..1000000).map { rand }

def quicksort1(list)
  return list if list.length <= 1 # recursive exit condition
  pivot = list.shift # grab first el as pivot
  left, right = list.partition { |el| el < pivot } # split based on pivot
  quicksort1(left) + [pivot] + quicksort1(right) # recursive calls for sub-div partitions
end

def quicksort2(list)
  return list if list.length <= 1 # recursive exit condition
  pivot = list.pop
  left, right = list.partition { |el| el < pivot } # split based on pivot
  quicksort2(left) + [pivot] + quicksort2(right) # recursive calls for sub-div partitions
end

def quicksort3(list)
  return list if list.length <= 1 # recursive exit condition
  pivot = list.delete_at(list.length / 2)
  left, right = list.partition { |el| el < pivot } # split based on pivot
  quicksort3(left) + [pivot] + quicksort3(right) # recursive calls for sub-div partitions
end

def quicksort4(list)
  return list if list.length <= 1 # recursive exit condition
  pivot = list.delete_at(list.find_index(list.sample))
  left, right = list.partition { |el| el < pivot } # split based on pivot
  quicksort4(left) + [pivot] + quicksort4(right) # recursive calls for sub-div partitions
end

# last pivot

Benchmark.bm do |x|
  x.report("first")  { quicksort1(list) }
  x.report("last")   { quicksort2(list) }
  x.report("middle") { quicksort2(list) }
  x.report("random") { quicksort3(list) }
end

