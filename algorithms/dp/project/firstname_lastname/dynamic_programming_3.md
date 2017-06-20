# Dynamic Programming: Part 2

Today's half of the project is designed to challenge you. These problems have some tricky recursive structures that might be hard to wrap your mind around. For that reason, we'll ask you in each of these to build it out both top-down and bottom-up so that you really get a handle on the recursion.

Although we'll only build out three functions in this assignment, pay close attention to the techniques we use throughout. These techniques often carry forward into other advanced applications of dynamic programming.

**NB**: if recursion doesn't really make sense to you yet, don't despair. Practice. Recursion only makes sense with a lot of practice.  

### Knapsacks

Imagine that you're given a knapsack (or "backpack" as it's sometimes called) that can carry up to *C* pounds of cargo. You also have a collection of items to choose from. Each item has a weight and a value. Your goal is to choose the optimal collection of items that can fit inside your knapsack. That is, you want to maximize the total value contained within the knapsack, while keeping the total weight under the capacity, *C*. We are not allowed to use any item more than once.

Before we start talking about this problem, let's define some notation. Item *i* will have weight <i>w</i><sub>i</sub> and value <i>v</i><sub>i</sub>. We'll also let *weights* = [<i>w</i><sub>1</sub>, <i>w</i><sub>2</sub>, ... <i>w</i><sub>k</sub>] and *values* = [<i>v</i><sub>1</sub>, <i>v</i><sub>2</sub>, ... <i>v</i><sub>k</sub>]. Note that we have *k* items to choose from.

You probably immediately have a sense that this problem lends itself well to recursion (beyond the fact that it's included in a dynamic programming problem set!). Let's make a first stab at the recursive structure here. It makes sense to think about *including* or *excluding* the first item on our list. 
### Smallest Window

### Mins and Maxes
