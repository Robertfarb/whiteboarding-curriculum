## Question Two

```ruby
def install_order2(arr)
  max = 0
  vertices = {}
  arr.each do |tuple|
    dependent = tuple[0]
    dependency = tuple[1]


    vertices[dependent] = Vertex.new(dependent) unless vertices[dependent]
    vertices[dependency] = Vertex.new(dependency) if dependency && !vertices[dependency]
    Edge.new(vertices[dependency], vertices[dependent]) if dependency
  end



  topological_sort(vertices.values).map { |v| v.value }
end
```
