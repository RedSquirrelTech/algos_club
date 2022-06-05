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
    results = []

    collection.length.times do
      results << collection.delete_at(min_index(collection))
    end

    results
  end

  def insertion_sort
  end

  def swap!(collection, from_index, to_index)
    tmp = collection[from_index]
    collection[from_index] = collection[to_index]
    collection[to_index] = tmp
  end

  def min_index(collection)
    min_index = 0
    collection.each_with_index do |item, index|
      if collection[min_index] > item
        min_index = index
      end
    end
    min_index
  end

end
