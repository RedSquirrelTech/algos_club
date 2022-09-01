require 'benchmark'
require_relative 'test_array'
require '../lib/algos_club'
require '../lib/algos_club/sorting'


Benchmark.bm(500) do |x|
  nums50 = Nums[0..50]
  nums100 = Nums[0..100]
  nums150 = Nums[0..150]
  nums200 = Nums[800..1000]
  x.report("BUBBLE SORT:50") {AlgosClub::Sorting.bubble_sort!(nums50)}
  x.report("BUBBLE SORT:100") {AlgosClub::Sorting.bubble_sort!(nums100)}
  x.report("BUBBLE SORT:150") {AlgosClub::Sorting.bubble_sort!(nums150)}
  x.report("BUBBLE SORT:200") {AlgosClub::Sorting.bubble_sort!(nums200)}
end


Benchmark.bm(500) do |x|
  nums50 = Nums[0..50]
  nums100 = Nums[0..100]
  nums150 = Nums[0..150]
  nums200 = Nums[0..200]
  x.report("quickSORT:50") {AlgosClub::Sorting.quick_sort!(nums50)}
  x.report("quickSORT:100") {AlgosClub::Sorting.quick_sort!(nums100)}
  x.report("quickSORT:150") {AlgosClub::Sorting.quick_sort!(nums150)}
  x.report("quickSORT:200") {AlgosClub::Sorting.quick_sort!(nums200)}
end
