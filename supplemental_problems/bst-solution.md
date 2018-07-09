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
