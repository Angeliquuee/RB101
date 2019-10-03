# What’s My Value (Part 7)
What will the following code print, and why? Don’t run the code until you have tried to answer.

```rb 
a = 7
array = [1, 2, 3]

array.each do |element|
	a = element
end 

puts a 
```

The variable `a` will become reassigned from the integer `7` to the integer `3` which is the last element in the array. It will be set to the last element because the `each` method iterates through the array, it will see `1`, `2`, and then settle on `3` because there is nothing left.

## Launch School Solution & Discussion
### Solution

```rb 
3
```

## Discussion

We are now dealing with a method invocation that has a block. The scoping rules for a method invocation with a block differ from the rules for method definitions. With method definitions, local variable scope is restricted to the method definition itself. In contrast, a method invocation with a block has more open scoping rules; the block can use and modify local variables that are defined outside the block.

In this case, `a` starts out as `7`, then we set `a` to `1`, `2`, and `3` in sequence. By the time we get to the `puts`, `a` has a value of 3.