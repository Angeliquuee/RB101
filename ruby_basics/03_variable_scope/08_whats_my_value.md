# What’s My Value (Part 8)
What will the following code print, and why? Don’t run the code until you have tried to answer.

```rb 
array = [1, 2, 3]

array.each do |element|
	a = element # only in the scope of this each block
end 

puts a # cannot extract the variable in the each block outside of it
```

This piece of code will actually raise an exception because there is an undefined local variable. The variable `a` was not set outside of this `each`, and so that is why we can’t reassign it, because we haven’t established it.

## Launch School Solution & Discussion
### Solution

```rb 
3
```

## Discussion

Compared to the previous exercise, the difference here is that we removed the initialization of the local variable `a` in the outer-most scope before invoking the `each` method and passing in a block. This leads to a completely different result. We now get an exception when the `puts` method is invoked with the local variable `a` as an argument on line 7 because the local variable `a` is not defined in this scope.

The local variable `a` that is initialized in the block passed to the `each` method has a scope that is local to that block. Since there is no local variable named `a` initialized in a scope external to the scope of that block, the expression `a = element` on line 4 is initialization and not reassignment.