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
end
