require 'algos_club/sorting'

RSpec.describe "sorting algorithms" do
  let(:sample){ [5, 9, 2, 1, 0, 3, 8, 4, 7, 6] }

  describe "bubble_sort" do
    it "sorting an empty collection returns an empty collection" do
      expect(AlgosClub::Sorting.bubble_sort([])).to be_empty
    end

    it "sorts the collection"
  end
end
