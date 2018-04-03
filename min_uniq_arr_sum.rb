require 'rspec/autorun'
require 'pry'

def getMinimumUniqueSum(arr)
  # first check for duplicate elements
  duplicates_present = arr.uniq.size != arr.size

  if duplicates_present
    # if we find a dupe, start incrementing it until it's no longer a dupe
    dupes = arr.uniq.select { |e| arr.count(e) > 1 }
    indexes = dupes.map { |i| arr.find_index(i) }
    indexes.each do |i|
      arr[i] += 1
    end

    arr.sum
  else
    arr.sum
  end
end

class Array
  def diff(other)
    # iterate over each element in self and remove its match in other

  end
end

RSpec.describe "getMinimumUniqueSum" do
  it {
    expect(getMinimumUniqueSum([1, 2, 4])).to eq 7
    expect(getMinimumUniqueSum([1, 2, 2])).to eq 6
    expect(getMinimumUniqueSum([2, 2, 4, 5])).to eq 14
  }
end
