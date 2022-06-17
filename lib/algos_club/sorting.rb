module AlgosClub::Sorting
  extend self

  def bubble_sort!(collection)
    # init the flag for our while loop
    still_swappin = true

    # start loop, go until we haven't swapped any indexes
    while still_swappin do
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
    return collection

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
      #base case
      return collection
    else
      #recursive case
      pivot_idx = collection.length/2
      # destuctive and return el
      pivot_el = collection.delete_at(pivot_idx)
      high,low = [], []

      collection.each do |el|
        if el > pivot_el
          high.push(el)
          # push into high
        else
          low.push(el)
          # push into low
        end
      end

      return quick_sort!(low) + [pivot_el] + quick_sort!(high)
    end
  end

  def insertion_sort!(collection)
    i = 1
    while i < collection.length do
      j = i
      while j > 0 && collection[j-1] > collection[j] do
        swap!(collection, j-1, j)
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
      if index < collection.length/2
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

    while !col_a.empty? && !col_b.empty? do
      # add the smallest item from either a or b to the results
      if col_a.first <= col_b.first
        results << col_a.delete_at(0)
      else
        results << col_b.delete_at(0)
      end
    end

    # append which ever list still has items to the results
    if col_a.empty?
      results + col_b
    else
      results + col_a
    end
  end
end
