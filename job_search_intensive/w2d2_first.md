# W2D2

## Pair Programming

### Prototype (15 mins)
What is the ""prototype"" in JavaScript?

What is the difference between defining something on the prototype versus defining it in the constructor function?

### Output (15 mins)
```javascript
var testFunc = function testFunc(test) {
  if (test) {
    var a = 4;
  }
  console.log(a)
}
testFunc(true);
```

1) Can you explain to me what this code does? Line by line?
2) What is the output of the last line?
3) Tell me what hoisting is.
4) Can you explain how hoisting works with the JavaScript interpreter?

5) What happens if I change testFunc(true) to testFunc()
6) What is undefined in JavaScript?
7) What is truthy and falsey?
8) How will this code get evaluated in the interpreter?

9) What happens if I change var a = 4; to const a = 4; ?"

### Store a Tree (40 mins)
Store an poly-ary tree using sql such that I can find all the children of a given node with A SINGLE QUERY!

Design your schema and write a controller action for storing new nodes in Rails.

Note: the result is a list of children nodes, not a subtree.

What if we wanted to insert a node in between a node and its parent? How would your code handle this?


### Popular times to eat (35 mins)
Given a series of LogRecords, how could we figure out the hour where there were the most people at a restaurant? Each LogRecord has 1) the number of people in a group who came to eat, 2) The time they came in, 3) the time they left

Write your code in ActiveRecord!

**Zip up your work and email to amaciver@appacademy.io**
