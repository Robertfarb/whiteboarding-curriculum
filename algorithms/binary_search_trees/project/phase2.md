## Phase 2: Binary Search Trees in Action

In this part of the lesson, we'll use our newly created BST to do a few fun things. These are pretty typical interview questions, though they are on the medium-hard to hard side of what you're likely to encounter in your search.

**NO CHEATING!**. Don't Ask Jeeves or Jeeves' lesser cousin, Google. Figure these out on your own!

#### `kth_largest`

Write a function that takes in a binary search tree and an integer *k*, and returns the <i>k</i>th largest element in the BST.

#### `lowest_common_ancestor`

In a binary search tree, an *ancestor* of a `example_node` is a node that is on a higher level than `example_node`, and can be traced directly back to `example_node` without going up any levels. (I.e., this is intuitively what you think an ancestor should be.) Every node in a binary tree shares at least one ancestor -- the root. In this exercise, write a function that takes in a BST and two nodes, and returns the node that is the lowest common ancestor the given nodes.

#### `post_order_traversal`

A *post-order traversal* of a tree is a variation on in-order traversal. It is performed as follows:

1. Perform a post-order traversal of the left subtree,
2. Perform a post-order traversal of the right subtree,
3. Record the value of the root.

Write a function that takes in a BST and returns the underlying data set in post-order traversal order.

There is a third common traversal as well: *pre-order traversal*. Can you hazard a guess at its algorithm?

#### `reconstruct`

We now have the ability to perform in-order and post-order traversals on our BSTs (and maybe pre-order if you wrote that one!). Let's go in reverse. It's not possible to write a function that reconstructs a BST using *only* its in-order traversal (why? find a counterexample!).  However, we can do so with either the pre- or post-order traversals. Write a function that takes in a tree's post-order traversal and uses that data to reconstruct the original BST.
