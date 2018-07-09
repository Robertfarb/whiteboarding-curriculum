## Travsersals

### In Order Traversal

```ruby
def in_order_traversal(tree_node = @root, arr = [])
    # left children, itself, right children
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
end
```

### Pre Order Traversal

```ruby
def in_order_traversal(tree_node = @root, arr = [])
    arr.push(tree_node.value)
    
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
end
```

### Post Order Traversal

```ruby
def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end
    
    arr.push(tree_node.value)

    arr
end
```

## Lowest Common Ancestor

### `#lca` recursive

```ruby

def lca(tree_node, node1, node2)
  smaller = node1.value < node2.value ? node1.value : node2.value
  bigger = node1.value > node2.value ? node1.value : node2.value

  if tree_node.value >= smaller && tree_node.value <= bigger
    lca = tree_node
  elsif tree_node.value > smaller && tree_node.value > bigger
    lca = lca(tree_node.left, node1, node2)
  elsif tree_node.value < smaller && tree_node.value < bigger
    lca = lca(tree_node.right, node1, node2)
  end

  lca
end
```

### `#lca` iterative

```ruby
def lca_iter(tree_node, node1, node2)
  smaller = node1.value < node2.value ? node1.value : node2.value
  bigger = node1.value > node2.value ? node1.value : node2.value

  while !(tree_node.value >= smaller && tree_node.value <= bigger)
    if tree_node.value > smaller && tree_node.value > bigger 
      tree_node = tree_node.left 
    elsif tree_node.value < smaller && tree_node.value < bigger
      tree_node = tree_node.right 
    end 
  end

  tree_node
end
```

### `next_largest`

```ruby
# O(log(n)) if BST is balanced
def next_largest(node)
  if node.right
    # find smallest node to the right
    return left_most_node(node.right)
  end

  # no nodes to the right; climb up
  until true
    parent_node = node.parent
    if parent_node.nil?
      # at the top of the tree, and nothing bigger to the right.
      return nil
    elsif parent_node.left == node
      # parent is bigger than us
      return parent_node
    else
      # parent is smaller, keep climbing.
      node = parent_node
    end
  end
end

def left_most_node(node)
  # keep going down and to the left
  node = node.left until node.left.nil?

  node
end
```

In this solution we have two cases. In the first case, the node has a node to the right. If this is the case, we can find the next largest node by going to the node's right, then finding the left-most node from that tree.

Example: (pseudocode)

```ruby
        5
      /   \
    2       7
  /   \   /   \
1      3 6     8

left_most_node(node_5)
=> node_6
```

If we pass in `node_x` there is nothing to the right, we instead look up to the parent node. If there is no parent, `node_x` is the largest node. If the parent's right node is `node_x`, the parent is smaller, so we move upwards again.

Example: (pseudocode)

```ruby
        5
      /   \
    2       7
  /   \   /   \
1      3 6     8

left_most_node(node_3)
=> node_5
```

### `isBalancedTree`

In our brute-force solution, we traverse our tree, finding the depth at each node using a helper `getDepth` function, which travels all the way to the leaf nodes of the tree and returns a depth. We then make recursive calls to make sure that both the left and right sides of the tree are also balanced. `getDepth` takes `O(n)` time, where `n` is the number of nodes, and `isBalanced` takes `O(n)` time, since we must call it once for each node. This leads to a total time complexity of `O(n**2)`.

```js

// Take in the root node
function isBalanced (node) {
  // Base case: the tree is empty.  Return true.
  if (!node) {
    return true;
  }

  // Get the depths of left and right subtrees and compare
  var leftDepth = getDepth(node.left);
  var rightDepth = getDepth(node.right);
  var depthDiff = Math.abs(leftDepth - rightDepth);

  // The tree is balanced if both subtrees are balanced AND
  // the difference in depths of those subtrees is between -1 and 1
  return (isBalanced(node.left) && isBalanced(node.right)) && depthDiff < 2;
}

function getDepth (node) {
  // Base case: empty tree.  Depth is 0.
  if (!node) {
    return 0;
  }

  // Take the larger depth of the two subtrees, calculated recursively
  return Math.max(getDepth(node.left), getDepth(node.right)) + 1;
}
```

We can do better by avoiding repetitive calls to `isBalanced`. Rather than checking all the way to the leaf nodes at each point in our tree, we can simply make it to the leaf nodes first and return a depth as we traverse back up.

```javascript
function isBalanced (node) {
  return isBalancedNode(node).isBalanced;
}

function isBalancedNode (node) {
  if (!node) {
    return {isBalanced: true, depth: -1};
  }

  let left = isBalancedNode(node.left);
  let right = isBalancedNode(node.right);

  if (left.isBalanced && right.isBalanced &&
        Math.abs(left.depth - right.depth) <= 1) {
    return {isBalanced: true, depth: Math.max(right.depth, left.depth) + 1};
  } else {
    return {isBalanced: false, depth: 0};
  }
}
```
