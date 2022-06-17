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

end
