require 'rspec/autorun'
require 'pry'

def electionWinner(votes)
  # sorted alphabetical hash
  sorted = Hash[ votes.group_by { |x| x }.map { |k,v| [ k, v.count ] } ].
    sort_by { |k, v| v }
  most_votes_count = sorted.last.last
  reverse_alphabetical = sorted.select { |name, count| count >= most_votes_count }.sort
  reverse_alphabetical.last.first
end

RSpec.describe "#electionWinner" do
  votes = %w(
  Alex
  Michael
  Harry
  Dave
  Michael
  Victor
  Harry
  Alex
  Mary
  Mary
  )

  it 'uses the last alphabetical candidate in the case of a tie' do
    expect(electionWinner(votes)).to eq "Michael"
  end
end
