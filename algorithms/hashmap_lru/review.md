## HashMap & LRU Cache Review

---

## Sets
- Max Int Set
- Int Set
- Resizing Int Set

---

## Hashing
- Brief review over the array hashing function
```ruby
class Array
  def hash
    each_with_index.inject(0) do |intermediate_hash, (el, i)|
      (el.hash + i.hash) ^ intermediate_hash
    end
  end
end
```

---
