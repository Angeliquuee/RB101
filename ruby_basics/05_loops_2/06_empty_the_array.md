# Empty the Array
Given the array below, use `loop` to remove and print each name. Stop the loop once `names` doesn’t contain any more elements.

```rb
names = ['Sally', 'Joe', 'Lisa', 'Henry']
```

Keep in mind to only use `loop`, not `while`, `until`, etc.

### My Solution

```rb 
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
	puts names.pop
	break if names.empty?
end

# This also answers further exploration question
```

## Launch School Solution & Discussion
### Solution

```rb
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end
```

### Discussion

Loops are really useful for iterating through arrays, therefore, it’s important to know how to stop them when you need to. In this case, we want to stop the loop once `names` is empty. To do this, we first need to figure out how to print each name while removing it from the array. There are a couple ways to do this, but we’ve chosen to use the `Array#shift` method. `#shift` removes the first element from an array and return its value. This allows us to simply `#puts` the returned value.

Now that we’re removing an element from `names` upon each iteration, we can stop the loop once the array is empty. `Array#empty?` is a really handy method for situations like this. `#empty?` simply checks to see if there are any elements in an array and returns a boolean. This allows us to add a `break` and an `if names.empty?` condition to stop the loop.

### Further Exploration

Our solution prints the names from first (`Sally`) to last (`Henry`). Can you change this to print the names from last to first?