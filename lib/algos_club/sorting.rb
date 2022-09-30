require 'pry'

module AlgosClub::Sorting
  extend self

  def bubble_sort!(collection)
    # init the flag for our while loop
    still_swappin = true

    # start loop, go until we haven't swapped any indexes
    while still_swappin
      # start the loop assuming that everything is sorted
      still_swappin = false
      # go through indexes in the array
      (collection.length - 1).times do |i|
        # if the values of the indexes aren't in the correct order...
        if collection[i] > collection[i + 1]
          # swap 'em!
          swap!(collection, i, i + 1)
          # oops, it wasn't sorted, switch flag to true so tha we loop again
          still_swappin = true
        end
      end
    end

    # if we've arrived here, it means we go through an entire loop
    # without swapping, which means everything should be sorted
    collection
  end

  def selection_sort!(collection)
    # create a new array to store the results
    results = []

    # loop once for every element in the collection
    collection.length.times do
      # find the minimum item by index
      # remove it from `collection`
      # add it to the `results`
      results << collection.delete_at(min_index(collection))
    end

    # return the results array
    results
  end

  def quick_sort!(collection)
    if collection.length < 2
      # base case
      collection
    else
      # recursive case
      pivot_idx = collection.length / 2
      # destuctive and return el
      pivot_el = collection.delete_at(pivot_idx)
      high, low = [], []

      collection.each do |el|
        if el > pivot_el
          high.push(el)
          # push into high
        else
          low.push(el)
          # push into low
        end
      end

      quick_sort!(low) + [pivot_el] + quick_sort!(high)
    end
  end

  def insertion_sort!(collection)
    i = 1
    while i < collection.length
      j = i
      while j > 0 && collection[j - 1] > collection[j]
        swap!(collection, j - 1, j)
        j -= 1
      end
      i += 1
    end
    collection
  end

  def merge_sort(collection)
    # base case
    return collection if collection.length <= 1

    a, b = [], []
    # divide collection into two arrays
    collection.each_with_index do |el, index|
      if index < collection.length / 2
        a << el
      else
        b << el
      end
    end

    # recursively call merge_sort on each division of the collection
    a = merge_sort(a)
    b = merge_sort(b)

    # merge the sub lists
    merge(a, b)
  end

  def identify_run(collection, start_index)
    # guard clause which returns start index, end_index as start_index, and local trend as increasing if the start index equals the collection's last index
    last_index = collection.length - 1
    return { run_start_idx: last_index, run_end_idx: last_index } if start_index == last_index
 
    # local trend is ascending by default
    # assign run_end_idx to start_index
    local_trend = 'ascending'
    run_end_idx = start_index

    # if the value at the start index in the collection is greater than the value of the run_end_idx + 1
    if collection[start_index] > collection[run_end_idx + 1]
      # while loop which runs if this same condition is true except we are only checking end index variable
      while (collection[start_index] > collection[run_end_idx + 1]) do
        #increment end index
        run_end_idx += 1
        # break loop if end index equals collection's last index
        break if run_end_idx == last_index
      #end
      end
      #reassign local trend to decreasing
      local_trend = 'decreasing'
    else
      # while loop which runs if the value at the run_end_idx is less than or equal to run_end_idx + 1
      while (collection[run_end_idx] <= collection[run_end_idx + 1]) do
        #increment end index
        run_end_idx += 1
        # break loop if end index equals collection's last index
        break if run_end_idx == last_index
      end
    end
    # return start_index, run_end_idx and local trend in a hash
    return { run_start_idx: start_index, run_end_idx: run_end_idx, local_trend: local_trend }
end

def reverse_run!(collection, run_start_idx, run_end_idx)
  # while starting index is less than end index and start index does not equal end index
  while (run_start_idx < run_end_idx && run_start_idx != run_end_idx) do
    # run swap in place
    swap!(collection, run_start_idx, run_end_idx)
    # increment start index by 1
    run_start_idx += 1
    # decrement end index by 1
    run_end_idx -= 1
  end
end

def tim_sort_no_gallop(collection)
  return collection if collection.length <= 1

  #declare min_run_length, empty run_stack, starting index of collection: s, end index of collection: e
  min_run_length = 3
  run_stack = []
  start_idx = 0
  end_idx = collection.length - 1

  # while loop which runs until s >= e
  while (start_idx <= end_idx) do
    # identify run based on collection, s and return the starting run index, end run index, and direction of the run
    run_info = identify_run(collection, start_idx)
    run_start_idx = run_info[:run_start_idx]
    run_end_idx = run_info[:run_end_idx]
    local_trend = run_info[:local_trend]
    
    # calculate run length based on run start and end indices
    run_length = (run_end_idx - run_start_idx) + 1

    # if trend of identified run is desending
    if local_trend == 'descending'
      reverse_run!(collection, run_start_idx, run_end_idx)
      binding.pry
      # reverse the run in place
      # TODO:
    end

    # if the run is smaller than minimimum run
      # extend the run(by reassigning the ending index) to the smaller of either:
        # the remaining distance to make the run equal to the minimum run or the distance to the end of the collection
      # copy the run from the collection using start and end index
      # run insertion sort on this copy in place
    # else just copy run from the collection using start and end index

    #push run onto run stack

    # reassign s to the run's end index and add 1
  # end of while loop 
  end
  
  # while run stack length is greater than 1
    # pop off two runs and save them in vars
    # merge two runs
    # push the merged run onto the top of the stack
  # end of while loop

  # return the remaining sorted single array in the run stack
end

  def heap_sort(collection)
    heapify(collection)
    end_index = collection.length - 1

    while end_index > 0 
      swap!(collection, 0, end_index)
      end_index -= 1

      sift_down(collection, 0, end_index)
    end
    collection
  end

  def swap!(collection, from_index, to_index)
    # temporarily store the item at the `from_index`
    tmp = collection[from_index]
    # set the value of the `from_index` to that of the item located at the `to_index`
    collection[from_index] = collection[to_index]
    # update the item at the `to_index` with what was located at the `from_index`
    collection[to_index] = tmp
  end

  def min_index(collection)
    # set the min_index to the first item in the collection
    min_index = 0
    # loop over the collection
    collection.each_with_index do |item, index|
      # update the min_index anytime we find an item with a lower value
      if collection[min_index] > item
        min_index = index
      end
    end
    # return the min_index, which is the position of the minimum value
    min_index
  end

  def merge(col_a, col_b)
    # create a new collection to hold the results
    results = []

    while !col_a.empty? && !col_b.empty?
      # add the smallest item from either a or b to the results
      results << if col_a.first <= col_b.first
        col_a.delete_at(0)
      else
        col_b.delete_at(0)
      end
    end

    # append which ever list still has items to the results
    if col_a.empty?
      results + col_b
    else
      results + col_a
    end
  end

  def left_child_index(index)
    (index * 2) + 1
  end

  def right_child_index(index)
    (index * 2) + 2
  end

  def parent_index(index)
    return if index == 0
    ((index - 1) / 2).floor
  end

  def heapify(collection)
    start_index = parent_index(collection.length - 1)

    while start_index >= 0
      sift_down(collection, start_index, collection.length - 1)
      start_index -= 1
    end
  end

  def sift_down(collection, start_index, stop_index)
    root = start_index
    while left_child_index(root) <= stop_index
      child = left_child_index(root)
      swap_index = root

      if collection[swap_index] && collection[child] && collection[swap_index] < collection[child]
        swap_index = child
      end

      if child + 1 <= stop_index && collection[swap_index] && collection[child + 1] && collection[swap_index] < collection[child + 1]
        swap_index = child + 1
      end

      return if swap_index == root
      swap!(collection, root, swap_index)
      root = swap_index
    end
  end
end
