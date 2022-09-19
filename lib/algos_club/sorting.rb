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

  def is_continuing_trend(collection, start_index, end_index, local_trend)
    if local_trend == "ascending"
      collection[end_index] >= collection[start_index]
    elsif local_trend == "descending"
      collection[end_index] < collection[start_index]
    end
  end 

  def identify_run(collection, start_index)
    end_index = start_index+1
    if collection[end_index] >= collection[start_index]
      local_trend = "ascending"
      start_index+=1
      end_index+=1
      while is_continuing_trend(collection, start_index, end_index, local_trend) do
        end_index+=1
      end
    else
  end
  end

  def tim_sort_no_gallop(collection)
    return collection if collection.length <= 1


    min_run_length = 3
    run_stack = []
      # local_run = []
      # local_trend = ''
    #identifying runs
    start_index = 0
    end_index = collection.length-1
  
    while start_index < end_index do
      run_info = identify_run(collection, start_index)
    end
    #while loop from begin of array to end
      #count run function which determines increasing or decreasing and starting/ending indices of a run
        #if 2nd element is greater than or equal to 1st element
          # mark as increasing
          # while loop until ^this is no longer true
            # increment the ending index   
        #else
          # mark as decreasing
          # while loop until this is no longer true
            # increment the ending index 
        #returns hash with starting index, ending index, and increasing/decreasing boolean
      #reverse if its decreasing
      #extend run if its not long enough
        #determine the index to extend to either the distance to the end of the list or until the run length == minrun length
        #copy collection using extend index and starting index
        # insertion sort on list 
      #push run onto stack using the determined indices
      #set index for the while loop to start again    

    # collection.each_with_index do |el , index|
    #   if local_trend == 'create_min_run' && local_run.length >= min_run_length
    #     local_trend = ''
    #     self.insertion_sort!(local_run)
    #     run_stack << local_run
    #     local_run = []
    #     local_trend = ''
    #   elsif local_run.length == 0
    #   elsif local_trend.empty? && el < local_run[-1]
    #     local_trend = 'descending'
    #   elsif local_trend.empty? && el > local_run[-1]
    #     local_trend = 'ascending'
    #   elsif is_continuing_trend(local_run, 'descending', el) && local_run.length >= min_run_length
    #     reversed_run = local_run.reverse()
    #     run_stack << reversed_run
    #     local_run = []
    #     local_trend = ''
    #   elsif is_continuing_trend(local_run, 'ascending', el) && local_run.length >= min_run_length
    #     run_stack << local_run
    #     local_run = []
    #     local_trend = ''
    #   elsif local_run.length < min_run_length && index != collection.length-1
    #     local_trend = 'create_min_run'
    #   end

    #   local_run << el

    #   if index == collection.length-1 && local_run.length > 0
    #     self.insertion_sort!(local_run)
    #     run_stack << local_run
    #   end
    # end
    pp run_stack
    puts 'RUN STACK BEFORE MERGING ^^^^'

    while run_stack.length > 1
      run1 = run_stack.pop()
      run2 = run_stack.pop()
      merged_run = self.merge(run1, run2)
      run_stack << merged_run
    end
    puts run_stack
    puts 'RUN STACK AFTER MERGING'
    run_stack[0]
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
