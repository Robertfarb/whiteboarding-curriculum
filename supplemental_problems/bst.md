# Binary Search Tree

## Warm Up

* Implement Post Order Traversal
  * Left, Right, Root
* Implement Pre Order Traversal
  * Root, Left, Right
  
## Lowest Common Ancestor

In a binary search tree, an *ancestor* of a `example_node` is a node that is on a higher level than `example_node`, and can be traced directly back to `example_node` without going up any levels. (I.e., this is intuitively what you think an ancestor should be.) Every node in a binary tree shares at least one ancestor -- the root. In this exercise, write a function that takes in a BST and two nodes, and returns the node that is the lowest common ancestor of the given nodes. Assume no duplicate values.

## Reverse Pairs

Given an array nums, we call ```(i, j)``` an important reverse pair if ```i < j``` and ```nums[i] > 2*nums[j]```.

Your goal is to return the number of important reverse pairs in the given array.

### Examples

```
Input: [1,3,2,3,1]
Output: 2
```
```
Input: [2,4,3,5,1]
Output: 3
```

## [Solutions](./bst-solution.md)
