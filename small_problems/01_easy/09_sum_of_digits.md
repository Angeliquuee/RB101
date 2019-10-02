# Sum of Digits
Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Examples:

```rb
puts sum(23) == 5
puts sum(496) == 19
puts sum(123456789) == 45
```

The tests above should print `true`.

For a challenge, try writing this without any basic looping constructs (`while`, `until`, `loop`, and `each`)

```rb
def sum(integer)
  # Converting the integer into a string
  integer_string = integer.to_s
  # Converting the positive integer into an array
  array = integer_string.each_char.map(&:to_i)
  # Using the inject method from previous exercise to grab the sum
  sum = array.inject(0) { |x, y| x + y }
end

p sum(23) # => 5
p sum(496) # => 19
p sum(123_456_789) # => 45
```

Here is a user submitted solution,  where they solve this problem with one line of code (which I really need to start doing).

```rb
def sum(number)
  number.to_s.split(//).map(&:to_i).reduce(:+)
end
```

## Launch School Solution & Discussion
### Solution 1

```rb 
def sum(number)
	sum = 0
	str_digits = number.to_s.chars

	str_digits.each do |str_digit|
	  sum += str_digit.to_i
	end

	sum
end
```

### Solution 2

```rb 
def sum(number)
	number.to_s.chars.map(&:to_i).reduce(:+)
end
```

### Discussion

This exercise proves to be tricky in a couple of ways. First, if you tried to split the number while it twas an integer you probably got an error. They key here’re is to convert it to a string, then split it, like this: 

```rb 
23.to_s.chars # => ["2", "3"]
```

To remember that we are dealing with strings, we assign this array to a variable named `str_digits`. We then iterate over our array and, on each iteration, increment the sum by the given digit converted back to an integer.

What would happen if we forgot to convert the string digits back to integers? We would get a `TypeError` telling us that we can’t coerce a string into an integer. We would be trying to add a string like `’2'` to our initial value of `’0’` which is not allowed. 

Let’s look at the second solution. If you did the last exercise, you may think of using `#reduce` to sum the numbers in an array like this:

```rb 
def sum(number)
	number.to_s.chars.reduce(:+)
end
```

If you tried this, however, you probably got unexpected results. `#reduce` worked, but instead of adding integers, it was adding strings, which isn’t what you want. Again, the array of strings needed to be converted to an array of integers. We can do this using `#map` and Ruby’s shorthand syntax:

```rb 
["2" , "3"].map(&:to_i) # => [2, 3]
```

If that looks confusing, just remember that it’s the same as this:

```rb 
["2", "3"].map { |element| element.to_i } # => [2, 3]
```

It’s possible to invoke all of these methods in one statement due to the return values of each method. All four of the methods used in the solution return the object we need to continue chaining methods. The following code shows the return value of each method:

```
23.to_s # => "23"
  .chars # => ["2", "3"]
  .map(&:to_i) # => [2, 3]
  .reduce(:+) # => 5
```

This makes for very compact code, but maybe less readable than the first solution. 