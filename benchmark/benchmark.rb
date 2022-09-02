require 'benchmark'
require_relative 'test_array'
require '../lib/algos_club'
require '../lib/algos_club/sorting'

# BUBBLE sort
Benchmark.bmbm() do |x|
  nums200 = NUMS[0..200]
  nums400 = NUMS[0..400]
  nums800 = NUMS[0..800]
  nums1600 = NUMS[0..1600]
  nums3200 = NUMS[0..3200]
  x.report("BUBBLE SORT:200") {AlgosClub::Sorting.bubble_sort!(nums200)}
  x.report("BUBBLE SORT:400") {AlgosClub::Sorting.bubble_sort!(nums400)}
  x.report("BUBBLE SORT:800") {AlgosClub::Sorting.bubble_sort!(nums800)}
  x.report("BUBBLE SORT:1600") {AlgosClub::Sorting.bubble_sort!(nums1600)}
  x.report("BUBBLE SORT:3200") {AlgosClub::Sorting.bubble_sort!(nums3200)}
end

# SELECTION sort
Benchmark.bmbm() do |x|
  nums200 = NUMS[0..200]
  nums400 = NUMS[0..400]
  nums800 = NUMS[0..800]
  nums1600 = NUMS[0..1600]
  nums3200 = NUMS[0..3200]
  x.report("SELECTION SORT:200") {AlgosClub::Sorting.selection_sort!(nums200)}
  x.report("SELECTION SORT:400") {AlgosClub::Sorting.selection_sort!(nums400)}
  x.report("SELECTION SORT:800") {AlgosClub::Sorting.selection_sort!(nums800)}
  x.report("SELECTION SORT:1600") {AlgosClub::Sorting.selection_sort!(nums1600)}
  x.report("SELECTION SORT:3200") {AlgosClub::Sorting.selection_sort!(nums3200)}
end


# MERGE sort
Benchmark.bmbm() do |x|
  nums200 = NUMS[0..200]
  nums400 = NUMS[0..400]
  nums800 = NUMS[0..800]  
  nums1600 = NUMS[0..1600]  
  nums3200 = NUMS[0..3200]  
  x.report("merge sort:200") {AlgosClub::Sorting.merge_sort(nums200)}
  x.report("merge sort:400") {AlgosClub::Sorting.merge_sort(nums400)}
  x.report("merge sort:800") {AlgosClub::Sorting.merge_sort(nums800)}
  x.report("merge sort:1600") {AlgosClub::Sorting.merge_sort(nums1600)}
  x.report("merge sort:3200") {AlgosClub::Sorting.merge_sort(nums3200)}
end

# QUICK sort
Benchmark.bmbm() do |x|
  nums200 = NUMS[0..200]
  nums400 = NUMS[0..400]
  nums800 = NUMS[0..800]  
  nums1600 = NUMS[0..1600]  
  nums3200 = NUMS[0..3200]  
  x.report("quickSORT:200") {AlgosClub::Sorting.quick_sort!(nums200)}
  x.report("quickSORT:400") {AlgosClub::Sorting.quick_sort!(nums400)}
  x.report("quickSORT:800") {AlgosClub::Sorting.quick_sort!(nums800)}
  x.report("quickSORT:1600") {AlgosClub::Sorting.quick_sort!(nums1600)}
  x.report("quickSORT:3200") {AlgosClub::Sorting.quick_sort!(nums3200)}
end

# INSERTION Sort
Benchmark.bmbm() do |x|
  nums200 = NUMS[0..200]
  nums400 = NUMS[0..400]
  nums800 = NUMS[0..800]
  nums1600 = NUMS[0..1600]
  nums3200 = NUMS[0..3200]
  x.report("Insertion SORT:200") {AlgosClub::Sorting.insertion_sort!(nums200)}
  x.report("Insertion SORT:400") {AlgosClub::Sorting.insertion_sort!(nums400)}
  x.report("Insertion SORT:800") {AlgosClub::Sorting.insertion_sort!(nums800)}
  x.report("Insertion SORT:1600") {AlgosClub::Sorting.insertion_sort!(nums1600)}
  x.report("Insertion SORT:3200") {AlgosClub::Sorting.insertion_sort!(nums3200)}
end

# HEAP Sort
Benchmark.bmbm() do |x|
  nums200 = NUMS[0..200]
  nums400 = NUMS[0..400]
  nums800 = NUMS[0..800]
  nums1600 = NUMS[0..1600]
  nums3200 = NUMS[0..3200]
  x.report("HEAP SORT:200") {AlgosClub::Sorting.heap_sort(nums200)}
  x.report("HEAP SORT:400") {AlgosClub::Sorting.heap_sort(nums400)}
  x.report("HEAP SORT:800") {AlgosClub::Sorting.heap_sort(nums800)}
  x.report("HEAP SORT:1600") {AlgosClub::Sorting.heap_sort(nums1600)}
  x.report("HEAP SORT:3200") {AlgosClub::Sorting.heap_sort(nums3200)}
end

