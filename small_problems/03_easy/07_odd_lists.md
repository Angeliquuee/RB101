# Odd List
Write a method that returns an Array that contains every other element of an `Array` that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

```rb 
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123)
oddities([]) == []
```

### My Solution

```rb 
def oddities(array)
	odd = []
	array.each_with_index do |element, index|
		if index % 2 == 0
			odd << element
		end
	end
	odd
end
```

## Launch School Solution & Discussion

### Solution

```rb
def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
   odd_elements << array[index]
  index += 2
 end 
 odd_elements
end
```

### Discussion

This problem can be slightly confusing because we want the 1st, 3rd, and 5th, and so elements of the array, but these correspond to elements with index 0, 2, 4, etc. As long as you keep that in mind, there are many different ways to solve this problem correctly.

Our solution takes the most basic approach; rather than using any of a number of different Array methods, we use a simple `while` loop, incrementing our index by 2 with each iteration. For each iteration, we add the element value to our result Array, `odd_elements`.

### Further Exploration

Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

Try to solve this exercise in at least 2 additional ways.

```rb 
# Oddities: V1
def oddities(array)
  array.select.with_index { |item, index| item if index.even? }

# Oddities: V2
def oddities(array)
  odd = []
  (0..array.size - 1).step(2).each { |i| odd.push array[i] }
  odd
end

# Companion Method for Even Numbers
def evens(array)
  (0..array.size).select(&:odd?).map { |i| array[i] }
end
```
