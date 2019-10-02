# Array Average
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

Examples: 
```rb
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
```

The tests above should print `true`.

```rb
first_array = [1, 5, 87, 45, 8, 8]
second_array = [9, 47, 23, 95, 16, 52]

def average(array)
  # Adding all the integers together in the array
  sum = array.inject(0) { |sum, x| sum + x}
  # Dividing the sum with the length of the array to get the median
  puts sum / array.length
end

average(first_array) # => 25
average(second_array) # => 40
```

`inject` takes a value to start with (the `0` in the above example), and a block, and it runs that block once for each element of the list.

1. On the first iteration, it passes the value you provided as the starting value and the first element of the list, and it saves the value that your block returned (in this case `result + element`).
2. It then runs the block again, passing in the result from the first iteration as the first argument, and the second element from the list as the second argument, again saving the result.
3. It continues this way until it has consumed all elements of the list.

The easiest way to explain this may be to show how each step works, for the [1, 2, 3, 4] array example; this is an imaginary set of steps showing how this result could be evaluated:

```
[1, 2, 3, 4].inject(0) { |result, element| result + element }
[2, 3, 4].inject(0 + 1) { |result, element| result + element }
[3, 4].inject((0 + 1) + 2) { |result, element| result + element }
[4].inject(((0 + 1) + 2) + 3) { |result, element| result + element }
[].inject (((((0 + 1) + 2) + 3) + 4) { |result, element| result + element }

# => 10
```

- - - -

## Launch School Solution & Discussion
### Solution

```rb
def average(numbers)
	sum = numbers.reduce { |sum, number| sum + number }
	sum / numbers.count
end
```

### Discussion

Two things need to be done to find the average. First, add every number together. Second, divide the sum by the number of elements. We accomplish the first part by using `Enumerable#reduce` (also known as `#inject`), which combines all elements of the given array by applying a binary operation. This operation is specified by a block or symbol. We used a block in our solution, but we could have just as easily used a symbol, like this:

```rb 
numbers.reduce(:+)
```

Once we have the sum, all that’s left is to divide it by the number of elements. To do that, we use `#count` to count the number of elements in `numbers`. Then, we divide `sum` by the number of elements and return the quotient.

### Further Exploration

Currently, the return value of `average` is an `Integer`. When dividing numbers, sometimes the quotient isn’t a whole number, therefore, it might make sense to return a `Float`. Can you change the return value of `average` from an `Integer` to a `Float`?


```rb 
first_array = [1, 5, 87, 45, 8, 8]
second_array = [9, 47, 23, 95, 16, 52]

def average(array)
  # Instead of #inject, we will use #reduce.
  sum = array.reduce(:+)
  # Dividing the sum with the length of the array to get the median
  answer = sum / array.length
  # Further Exploration: Return the value of average from Integer to Float
  answer.to_f
end

p average(first_array) # => 25
p average(second_array) # => 40
```