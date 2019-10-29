# Multiplying Two Numbers
Create a method that takes two arguments, multiplies them together, and returns the result.

Example:

```rb 
multiply(5, 3) == 15
```

### My Solution

```rb 
def multiply(first_number, second_number)
	first_number * second_number
end

p multiply(5, 3)
```

## Launch School Solution & Discussion

### Solution

```rb 
def multiply(n1, n2)
  n1 * n2
end 
```

### Discussion

There are a couple of points of interest for this solution.

1. Focus on the return value. Consider the below incorrect implementation.

```rb 
def mulitply(n1, n2)
  puts n1 * n2
end 
```

If you run the code above, you may think that this method fulfills the requirements of the exercise, but it doesn’t. It’s important to remember to focus on the method’s *return value* and not its *output*. Also, keep in mind that `puts` returns `nil`, and the above incorrect implementation will *always* return `nil`.

2. The current implementation uses the `*` operator, which behaves differently depending on what the left hand expression is. For example:

```rb 
5 * 2 # => 10
"hi" * 2 # => "hihi"
``` 

Therefore, our method implementation also suffers from this behavior since we’re using the `*` operator. 

### Further Exploration

For fun: what happens if the first argument is an `Array`? What do you think is happening here?

As an example, we’re going to use the array `[5]` as our first argument. The second argument will be the integer 3. 

```rb 
multiply([5], 3) # => [5, 5, 5]
```

It looks as though, we have duplicated the integer 5 according to the second argument. In this case, we used 3, so ideally this method definition will print out `[5, 5, 5]`. The integer 5 (first argument that is an array) gets duplicated 3 (second argument) times within the array.

Let’s try another example, but with an array with multiple values.

```rb
multiply([5, 2], 4) # => [5, 2, 5, 2, 5, 2, 5, 2]
```

This behaves the same as the first example. We see that the array with the values of `[5, 2]` are being duplicated 4 times within the argument. 

