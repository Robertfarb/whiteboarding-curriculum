# Phase 1: Building a BST

In this project, we'll translate our conceptual idea of a binary search tree into a real, live Ruby object with all the functionality that we dreamt of.  

**NB**: this project doesn't have specs yet.  It's in beta!  Use the examples from the BST reading as sample test input, and make sure everything is working as you go.

## The Setup

First, we must consider carefully how we'd like to represent our BST and the nodes within it. There is not a single "right" way to do this, but there are some time complexities and functionality that we *must* achieve, namely:

- **Nodes**: allows each node to hold a value, `val`, and accesses and sets that `val` in constant time,
- **Child/parent connections**: allows each node to hold a left child and/or a right child, with access to the children in constant time

Notice that we don't necessarily *need* to represent a node's `parent` connection explicitly; however, that might be a useful attribute to track should we ever need it.  (How would we access `parent` if we don't define it in the constructor? How could this affect time complexities?)

It'll be helpful to separate our concerns into two structures: `BSTNode` and `BinarySearchTree`.  Each `BSTNode` will hold the information relevant to an individual node: its value and pointers to its children. For now, we'll leave off the pointer to its parent. The `BinarySearchTree` will house a collection of nodes tied together using the conceptual rules of the BST outlined in the videos and readings.  

## `BSTNode`

This class will be pretty simple. We need only an `#initialize` method and the appropriate `attr_accessor`s. Set these up in the BST class and make sure those specs pass.

## `BinarySearchTree`

Now comes the fun stuff. We'll recreate all the functionality discussed in the lecture on our `BinarySearchTree`, plus a couple extras.  

#### `#initialize`

Let's review how we conceptually created a binary search tree: we began with a root. Instantiate this within `#initialize`, and don't forget its accessor. Remember that the root is a node, and it ought to start off empty itself.

#### `#insert`

Recall our algorithm for inserting a node into a tree:

1. Compare the node's value to the root's value.
2. If the node is less than the root, insert into the left subtree. If there is no left subtree, the node becomes the root's left child.
3. If the node is greater than the root, insert into the right subtree. If there is no right subtree, the node becomes the root's right child.

Write this method.  `#insert` should take in a `BSTNode` and insert it into its proper position in the `BinarySearchTree`. Hint: this algorithm is recursive.

Once you have `#insert` working, go back and tweak it to account for duplicate values.

#### `#find`

Write a method that takes in a `val` and returns `true` if any node in the tree has value equal to `val` and false otherwise. Remember: a binary search tree keeps all nodes less than the root in its left subtree, and all nodes greater than the root in its right subtree.

**NB**: you had two choices for how to handle duplicates in `#insert`. Your implementation of `#find` will depend (to a small extent) on which of these choices you made.

#### `#delete`

This is the tricky one! Review the binary search tree reading for details. Here are the bullet points of the algorithm:

1. If a node has no children, simply remove it.
2. If a node has only one child, delete it and promote its child to take its place.
3. If a node has two children, find the largest node in its left subtree and promote that node to replace the deleted node. If necessary, promote that node's child to replace its parent.

You'll need a helper method, `#maximum`, for this one.  After that, the work that we want to do here essentially involves a lot of pointer swapping.  

#### `#is_balanced?` and `#depth`

Remember that a lynch pin in our binary search tree was ensuring that the tree was (and remained) *balanced* and thus maintained a depth that was approximately equal to `log (n)` where *n* is the number of nodes in the tree. Otherwise, we ended up with nasty cases like this one:

<img src="./diagrams/degenerate.png" />

We defined the *balanced* property as follows:

1. The depths of the left and right subtrees differ by at most 1,
2. Both the left and right subtrees are also balanced.

Write `#depth` first, as you will use this as a helper method in `#is_balanced?`. From there, recursion will once again be our friend.

#### `#in_order_traversal`

As our final Phase 1 exercise, let's implement `#in_order_traversal`, which returns the set of `val`s held by the nodes in the `BinarySearchTree` in sorted order. Recall our algorithm for this:

1. Perform an in-order traversal of the left subtree,
2. Print (or push) the value of the root,
3. Perform an in-order traversal of the right subtree.

Your `#in_order_traversal` method should return an array that contains the data set underlying the BST, in sorted order.

## What Our Tree Is and Isn't

Great job! You've built a basic BST. This structure has all the features of a binary search tree, but it's important to know what this tree isn't: it is *not* a self-balancing tree. That's important, because we have no safeguard to ensure that our time complexities remain logarithmic for `#find`, `#insert`, and `#delete`. The bonus after Phase 2 is a walk-through that has you create a self-balancing tree and goes over the rebalacing algorithm in more depth.

Before you explore the world of AVL/self-balancing trees, go on to use your tree for some interview-style questions. It's more important that you do Phase 2 than the bonus, because these are the kinds of exercises you may be expected to do on an actual interview. (No a/A student has ever been asked to implement a rebalancing algorithm or an AVL tree from scratch.  No one.)

Sally forth! [Phase 2](./phase2.md) awaits!  
