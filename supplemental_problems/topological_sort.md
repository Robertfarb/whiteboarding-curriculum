## Practical Problems

## Question 1

Partner A: Describe what a graph is, how it can be modeled, what types of situations we might use one in, and the types of search that it implies. Do not look at your notes.

Partner B: Describe Tarjan's Algorithm for Topological Sort.

---

## Question 2

Rewrite install order. In this version of the problem, all packages will be listed, (independent packages have nil value or no entry for their dependencies), but the package ids are not numbers. Do not use your notes.

NB: For clarity here, the package IDs are listed as integers. However, they may be strings, class instances, or anything else.

```ruby
arr = [[3, 1], [2, 1], [6, 5],
       [3, 6], [3, 2], [4, 3],
       [9, 1], [1, nil], [5, nil]]

install_order(arr) #=> [1, 5, 2, 9, 6, 3, 4]
```
---

Bonus: Allow for independent packages that are dependencies not to be listed seperately in the input array.

```ruby
arr = [[3, 1], [2, 1], [6, 5],
       [3, 6], [3, 2], [4, 3],
       [9, 1]]
       
install_order(arr) #=> [1, 5, 2, 9, 6, 3, 4]
```
---

## Question 3

Given a sorted dictionary (array of words) of an alien language, find the order of the characters in the language.

### Example
```
Input:  words = ["baa", "abcd", "abca", "cab", "cad"]
Output: 'b', 'd', 'a', 'c'
```
Note that words are sorted and in the given language "baa" comes before "abcd", therefore 'b' is before 'a' in output. Similarly, we can find other orders:
```
Input:  words = ["caa", "aaa", "aab"]
Output: 'c', 'a', 'b'
```

---

## Bonus 

If you have extra time, work on [this](https://www.geeksforgeeks.org/snake-ladder-problem-2/) problem (don't scroll down the solution!)

---

## [Solutions](https://github.com/appacademy/sf-job-search-curriculum/blob/master/supplemental_problems/topological_sort_solution.md)
