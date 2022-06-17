require 'algos_club/sorting'

RSpec.describe "sorting algorithms" do
  let(:sample){ [5, 9, 2, 1, 0, 3, 8, 4, 7, 6] }

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

  describe "swap!" do
    let(:from) { 0 }
    let(:to)   { 1 }

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
      expect(AlgosClub::Sorting.merge(a, b)).to match_array [1,2]
    end

    it "returns a sorted list with the contents of both lists when not the same size" do
      a = [2, 3]
      b = [1, 4, 5, 6]
      expect(AlgosClub::Sorting.merge(a, b)).to match_array [1,2,3,4,5,6]
    end

    it "returns a sorted list with the contents of both lists when not the same size regardless of positional args" do
      a = [1, 4, 5, 6]
      b = [2, 3]
      expect(AlgosClub::Sorting.merge(a, b)).to match_array [1,2,3,4,5,6]
    end

    it "returns a sorted list with all the same contents" do
      a = [17, 17]
      b = [17, 17]
      expect(AlgosClub::Sorting.merge(a, b)).to match_array [17,17,17,17]
    end
  end
end
