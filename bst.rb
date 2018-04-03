#!/usr/bin/env ruby

require 'pry'

class BSTreeNode
    attr_accessor :right, :left, :value
    def initialize(node_value)
        @value = node_value;
        @left = @right = nil;
    end
end

def isPresent(root, val)
  # write your code here
  # return 1 or 0 depending on whether the element is present in the tree or not
  # compare val to root
  # if you have a match, return 1
  # otherwise, recurse on left or right depending on whether the element is bigger or smaller
  return 0 unless root && root.value

  if root.value == val
    return 1
  elsif root.value && val > root.value # we need to traverse to the right
    isPresent(root.right, val)
  elsif root.value && val < root.value # we need to traverse to the left
    isPresent(root.left, val)
  end

  0
end

require 'rspec/autorun'

def _insert_node_into_binarysearchtree(node, data)
  if node == nil
    node = BSTreeNode.new(data)
  else
    if data <= node.value
      node.left = _insert_node_into_binarysearchtree(node.left, data);
    else
      node.right = _insert_node_into_binarysearchtree(node.right, data);
    end
  end

  return node;
end

RSpec.describe BSTreeNode do
  describe "#isPresent" do
    it 'returns true when the element is present in the tree' do
      root = BSTreeNode.new(2)
      expect(isPresent(root, 2)).to eq 1

      node = BSTreeNode.new(11)
      elements = [ 20, 10, 30, 8, 12, 25, 40, 6, 11, 13, 23, 4, 30, 10, 12, 15 ]
      for elem in elements
        _insert_node_into_binarysearchtree(node, elem)
      end
      expect(isPresent(node, 20)).to eq 1
      expect(isPresent(node, 2)).to eq 0
    end
  end
end
