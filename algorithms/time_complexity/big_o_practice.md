Outline:

Lecture:
- What is time complexity and why does it matter?
- Math you need
- Bounding
- Ex 1: iterative function dismantled
- Ex 2: recursive function dismantled
  - Have a mystery function whose time complexity varies
  - Start with mystery having constant complexity for easy evaluation
  - Then have mystery function having non-constant complexity and use a bound

Project:

# Time Complexity: Instructions

Today we're going to practice analyzing a few functions' time complexities. This is a unique topic; you'll have to be able to conjure the time complexity of your code on the spot in interviews, and you'll be expected to do so without the benefit of Googling the basics (like "What is a logarithm?"). Because of that, we have some special rules:

1. No Googling! Or Stack Overflowing or Asking Jeeves. Your resources are the TAs and your notes.
2. Pay careful attention to the **STOP** signs in the project. At these points, you'll be directed to pause to explain something to your partner or to a TA. This is for *you*, the person doing the explaining. The best way to learn something is to teach it, so strive to be clear and thorough when you are the explainer!
3. When you get to a **STOP** or you get stuck, post in the #placements-queue channel on Slack.
4. The partner sitting on the left is now **Partner A**, and on the right sits **Partner B**.

Notice also that we are somewhat language agnostic in this assignment -- that't intentional. Some of the subtler time complexity points do depend upon what language you're using, but for the most part the language won't matter for the big stuff. There are some exceptions, but for today, assume language doesn't matter.

Sally forth!  

### Arrays Are Awesome

Let's start with some array manipulation to get us warmed up. Find the time complexity of each of the following functions (in order -- they depend on each other). You may assume that all arrays are arrays of integers, for convenience. When you evaluate time complexity, remember to do each of the following:

1. Specify which aspect (or aspects) of the input the time complexity depends on. E.g., if a function is `O(n)`, what is *n*?
2. Explain thoroughly and clearly *why* the time complexity is what it is.
3. Find the *worst* cases. 
3. Discuss space complexity too: this is usually deemphasized over time complexity, but some interviewers will ask about it.
4. Find the constant factor. E.g., suppose the time complexity of some method is `O(n)` where *n* is the length of the array given to the function as input. If you iterate over this array exactly 3 times, the constant factor will be 3. Again, this is something that is typically deemphasized, but sometimes gets asked about.

**NB**: you can assume that any print statements (`console.log`, `puts`, etc.) run in constant time. We'll come back to this near the end, but this is also a safe assumption to make in interviews.

So, what's the time complexity of this function? Remember to find those constant factors as well as the overall time complexity, especially for these simple examples. **Partner A**, explain this one to **Partner B**.

1.
```ruby
def add(a, b)
  if a > b
    return a + b
  end

  a - b
end

```
Ok, now move onto this one. It's **Partner B**'s turn to explain:  

2.
```ruby
def print_arr_1(arr)
  arr.each do |idx|
    puts el
  end
end
```
Great, two easy ones out of the way! Now, what happens when we add just one more line? What changes, and what stays the same? (Don't forget about those constant factors!)

**NB**: alternate who does the explaining for the rest of the Warm-Ups.

3.
```ruby
def print_arr_2(arr)
  arr.each_with_index do |el, idx|
    break if idx == arr.length/2 - 1
    puts el
  end
end
```
Let's make another change, again asking ourselves how the time complexity is affected. 

4.
```ruby
def print_arr_3(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end
end
```
Finally, let's add a little bit to our code. 

5.
```ruby
def print_arr_4(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end

  arr.each_with_index do |el, idx|
    puts el if idx % 3 == 0
  end

  puts arr.last
end
```
Now let's make a bigger change.  Define a basic `search` function as follows:

6.
```ruby
def search(arr, target)
  arr.each_with_index do |el, idx|
    return idx if el == target
  end
end
```
Now, let's use this `search` within another function.  Determine the time complexity of the following:

7.
```ruby
def searchity_search(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, target + el)
  end

  results  
end
```
You may have noted that the *nested* nature of `search` within the loop of this function affects this drastically. But not all loops are created equal. Think carefully about this one:

8.
```ruby
def searchity_search_2(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, el)
  end

  results  
end
```

9.
```javascript
var a = 1;
var b = 1;

for (i = 0; i < N; i++) {
  for (j = N; j > i; j--) {
    console.log(b);
    b += a;
  }
}
```

10.
```javascript
for (i = 0; i < N; i++) {
  for (j = i+1; j < N; j++) {
    console.log(i);
    if (i + 5 > j - 2) {
      var spooky_sum = i - j + 2;
    }
  }
}
```

11.
```javascript
for (i = 0; i < N; i++) {
  for (j = 0; j < M; j++) {
    var mimble = i*j;
    var thimble = i + j;
    console.log(mimble + thimble);
  }
}
```

12.
```javascript
var spock = "Live long and prosper";
var picard = "Engage!";

for (i = 0; i < N; i++) {
  if(i % 2 === 0) {
    console.log(spock);
  } else {
    console.log(picard);
  }
}
for (j = 0; j < M; j++) {
  var kirk = "i have nothing to say";
}
```

13.
```javascript
var notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

for (i = 0; i < N; i++) {
  for (j = 0; j < N; j++) {
    var position = (i+j) % 8;
    console.log(notes[position]);
  }
}
for (k = 0; k < N; k++) {
  if (k < 8) {
    console.log("A great note is " + notes[k]);
  }
}
```

**At this point, look at the solutions, and for any problems that don't make 
sense, call over a TA to discuss!**

### Interacting with Iterativeness

Let's leave the arrays behind for a bit, and look at a few other functions. Start with **Partner A** explaining the time complexity of this one:

1.
```javascript
let iterative_1 = (n, m) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = 0; j < m; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
How do things change when we make this subtle alteration?

2.
```javascript
let iterative_2 = (n) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = i; j >= 0; j--) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
Now, let's combine both ideas. What's the time complexity of this function?

3.
```javascript
let iterative_3 = (n, m) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  let bigger = n > m ? n : m;
  let smaller = n <= m ? n : m;

  for (var i = 0; i < smaller; i++) {
    for (var j = i; j < bigger; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```

**STOP**. At this point, check in with the solutions!

### Radical Recursion

Recursive functions are among the toughest to evaluate for time complexity. Remember **FFS**:

1. <b>F</b>ind the time complexity of *one call*, ignoring the recursive calls,
2. <b>F</b>ind the number of times the function is called, and, if necessary, the input sizes on all of those calls.
3. <b>S</b>um everything together.

Let's start with something nice and simple. Don't forget to find the constant factor! (As a bonus, figure out a better name for this function than `rec_mystery` -- what is it doing?)

```ruby
def rec_mystery(n)
  return n if n < 5

  rec_mystery(n - 5)
end
```
Let's change things ever so slightly.  Now what is the time complexity?

```ruby
def rec_mystery_2(n)
  return 0 if n == 0

  rec_mystery_2(n/5) + 1
end
```

Now let's add in a bit of complexity with some extra variables in the mix.

```java
void rec_mystery_3(int n, int m, int o)
{
  if (n <= 0)
  {
    printf("%d, %d\n", m, o);
  }
  else
  {
    rec_mystery_3(n-1, m+1, o);
    rec_mystery_3(n-1, m, o+1);
  }
}
```
**STOP**. Once you've hit this point, you are clearly a wizard. Check in with the solutions, and in particular, look through `rec_mystery_2` and `rec_mystery_3` to make sure you understand.


class Array
  def grab_bag
    return [[]] if empty?
    bag = take(count - 1).grab_bag
    bag.concat(bag.map { |handful| handful + [last] })
  end
end
```
```javascript
Array.prototype.mixyUppy = function(){
  if (this.length === 1) {
    return [this];
  }

  var mixes = [];
  var prevMixes = this.slice(1).mixyUppy();

  prevMixes.forEach(function(mix) {
    mix.forEach(function(el, i) {
      mixes.push(
        mix.slice(0, i).concat(this[0], mix.slice(i))
      );
    }.bind(this));

    mixes.push(mix.concat(this[0]));
  }.bind(this));

  return mixes;
};
```


### Recursion's Revenge: Bubbling Bountiful Bounds

Now let's take a look at some more challenging stuff. You may find yourself using bounding in this section, along with FFS for recursive functions. Take a look at this one first, which is a modication of `rec_mystery_3`:

```java
void rec_mystery_3(int n, int m, int o)
{
  if (n <= 0)
  {
    printf("%d, %d\n", m, o);
  }
  else
  {
    rec_mystery_3(n-1, m+1, o);
    rec_mystery_3(n-1, m, o+1);
    rec_mystery_3(n-1, m+1, o+1);
    rec_mystery_3(n-1, m, o);
  }
}
```
That should have been a pretty straightforward use of bounding. The next one is a bit harder. Scroll down below the code to see a hint or two.

```ruby
class Array
  def grab_bag
    return [[]] if empty?
    bag = take(count - 1).grab_bag
    bag.concat(bag.map { |handful| handful + [last] })
  end
end
```
**Hint 1**: what is this function doing? Describe it in words, and use this to get a bound.

You can find the time complexity of `grab_bag` *without* bounding. Try drawing out the recursive calls like we did in lecture to see if you can do this.

**STOP**. TA Time again! Call someone over and explain `grab_bag` -- both ways if you can!

Well done! If you finished early, go ahead and start watching the 
[Video Lectures](https://github.com/appacademy/sf-job-search-curriculum/blob/master/w12/day1.md#afternoon) on Arrays that you'll need for the project tonight.

<!--### Blustery Bonuses

Well done, Padawans. Soon you will command your own starships, perhaps even the Enterprise. Here are a couple of fun bonuses in the meantime.

#### `silly_years`

Hey, this will look familiar!  Write a function that takes in a 4-digit year and returns `true` if the number formed by the first two digits plus the number formed by the last two equal the number formed by the middle two. E.g.:

1978 => `true` since 19 + 78 = 97.
2003 => `false` since 20 + 3 does not equal 0.

What's the time complexity of this silly function? Pay special attention to constant factors here!

#### `digital_root`

Another blast from the past! Write a function that takes in a positive integer and sums its digits until a single digit remains. E.g.:

12345 => 6 since 1 + 2 + 3 + 4 + 5 = 15, and 1 + 5 = 6.

**NB**: you'll have to use bounding here. And even with that, it's really stinkin' hard!-->
