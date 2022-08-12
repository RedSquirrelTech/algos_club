require "algos_club/sorting"

RSpec.describe "sorting algorithms" do
  let(:sample) { [5, 9, 2, 1, 0, 3, 8, 4, 7, 6] }

  describe "bubble_sort" do
    it "sorting an empty collection returns an empty collection" do
      expect(AlgosClub::Sorting.bubble_sort!([])).to be_empty
    end

    it "sorts the collection" do
      expect(AlgosClub::Sorting.bubble_sort!(sample)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "selection_sort" do
    it "sorting an empty collection returns an empty collection" do
      expect(AlgosClub::Sorting.selection_sort!([])).to be_empty
    end

    it "sorts the collection" do
      expect(AlgosClub::Sorting.selection_sort!(sample)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "quick_sort" do
    it "sorting an empty collection returns an empty collection" do
      expect(AlgosClub::Sorting.selection_sort!([])).to be_empty
    end

    it "sorts the collection" do
      expect(AlgosClub::Sorting.quick_sort!(sample)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "insertion_sort" do
    it "sorting an empty collection returns an empty collection" do
      expect(AlgosClub::Sorting.insertion_sort!([])).to be_empty
    end

    it "sorts the collection" do
      expect(AlgosClub::Sorting.insertion_sort!(sample)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "merge_sort" do
    it "sorting an empty collection returns an empty collection" do
      expect(AlgosClub::Sorting.merge_sort([])).to be_empty
    end

    it "sorts the collection" do
      expect(AlgosClub::Sorting.merge_sort(sample)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "heapsort" do
    it "sorting an empty collection returns an empty collection" do
      expect(AlgosClub::Sorting.heapsort([])).to be_empty
    end

    it "sorts the collection" do
      expect(AlgosClub::Sorting.heapsort(sample)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "swap!" do
    let(:from) { 0 }
    let(:to) { 1 }

    it "swaps position of two values in a collection" do
      dupped_sample = sample.dup
      AlgosClub::Sorting.swap!(dupped_sample, from, to)

      expect(dupped_sample[from]).to equal sample[to]
      expect(dupped_sample[to]).to equal sample[from]
      expect(dupped_sample.length).to equal sample.length
    end
  end

  describe "smallest_index" do
    it "returns the index of the min value" do
      expect(AlgosClub::Sorting.min_index(sample)).to be 4
    end
  end

  describe "merge" do
    it "returns a sorted list with the contents of both lists" do
      a = [2]
      b = [1]
      expect(AlgosClub::Sorting.merge(a, b)).to match_array [1, 2]
    end

    it "returns a sorted list with the contents of both lists when not the same size" do
      a = [2, 3]
      b = [1, 4, 5, 6]
      expect(AlgosClub::Sorting.merge(a, b)).to match_array [1, 2, 3, 4, 5, 6]
    end

    it "returns a sorted list with the contents of both lists when not the same size regardless of positional args" do
      a = [1, 4, 5, 6]
      b = [2, 3]
      expect(AlgosClub::Sorting.merge(a, b)).to match_array [1, 2, 3, 4, 5, 6]
    end

    it "returns a sorted list with all the same contents" do
      a = [17, 17]
      b = [17, 17]
      expect(AlgosClub::Sorting.merge(a, b)).to match_array [17, 17, 17, 17]
    end
  end

  describe "left_child_index" do
    it "returns the index of the left child" do
      current_index = 0
      expect(AlgosClub::Sorting.left_child_index(current_index)).to be 1
      expect(sample[AlgosClub::Sorting.left_child_index(current_index)]).to be 9

      current_index = 1
      expect(AlgosClub::Sorting.left_child_index(current_index)).to be 3
      expect(sample[AlgosClub::Sorting.left_child_index(current_index)]).to be 1

      current_index = 3
      expect(AlgosClub::Sorting.left_child_index(current_index)).to be 7
      expect(sample[AlgosClub::Sorting.left_child_index(current_index)]).to be 4

      current_index = 2
      expect(AlgosClub::Sorting.left_child_index(current_index)).to be 5
      expect(sample[AlgosClub::Sorting.left_child_index(current_index)]).to be 3
    end
  end

  describe "parent_index" do
    it "returns the index of the parent" do
      # let(:sample) { [5, 9, 2, 1, 0, 3, 8, 4, 7, 6] }
      current_index = 0
      expect(AlgosClub::Sorting.parent_index(current_index)).to be nil

      current_index = 1
      expect(AlgosClub::Sorting.parent_index(current_index)).to be 0
      expect(sample[AlgosClub::Sorting.parent_index(current_index)]).to be 5

      current_index = 2
      expect(AlgosClub::Sorting.parent_index(current_index)).to be 0
      expect(sample[AlgosClub::Sorting.parent_index(current_index)]).to be 5

      current_index = 3
      expect(AlgosClub::Sorting.parent_index(current_index)).to be 1
      expect(sample[AlgosClub::Sorting.parent_index(current_index)]).to be 9
    end
  end

  describe "right_child_index" do
    it "returns the index of the right child" do
      # let(:sample) { [5, 9, 2, 1, 0, 3, 8, 4, 7, 6] }
      current_index = 0
      expect(AlgosClub::Sorting.right_child_index(current_index)).to be 2
      expect(sample[AlgosClub::Sorting.right_child_index(current_index)]).to be 2

      current_index = 1
      expect(AlgosClub::Sorting.right_child_index(current_index)).to be 4
      expect(sample[AlgosClub::Sorting.right_child_index(current_index)]).to be 0

      current_index = 3
      expect(AlgosClub::Sorting.right_child_index(current_index)).to be 8
      expect(sample[AlgosClub::Sorting.right_child_index(current_index)]).to be 7

      current_index = 2
      expect(AlgosClub::Sorting.right_child_index(current_index)).to be 6
      expect(sample[AlgosClub::Sorting.right_child_index(current_index)]).to be 8
    end
  end

  describe "heapify(collection)" do
    # let(:sample) { [5, 9, 2, 1, 0, 3, 8, 4, 7, 6] }
    it "rearranges the values to be in a implied tree structure" do
      AlgosClub::Sorting.heapify(sample)
      expect(sample).to eq [9, 7, 8, 5, 6, 3, 2, 4, 1, 0]
    end
  end
end
