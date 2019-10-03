# What’s My Value (Part 10)
What will the following code print, and why? Don’t run the code until you have tried to answer.

```rb 
a = 7
array = [1, 2, 3]

def my_value(ary)
	ary.each do |b|
	 a += b
	end
end

my_value(array)
puts a
```

Here we have two variables that are location in the global scope which are `a` which is referencing the integer `7` and `array` which is pointing to an array of integers `[1, 2, 3]`.

Next, we’ve created a whole new scope, because we initialized a method definition. Within that method definition we passing in an array as our argument. However, the variable `a` cannot be seen inside of the new scope of the method definition and so it will raise an exception `undefined method '+' for nil:NilClass (NoMethodError)`

## Launch School Solution & Discussion
### Solution

```
undefined method `+' for nil:NilClass (NoMethodError)
```

## Discussion

`a` at the top level is not visible inside the invocation the `each` method with a block because the invocation of `each` is inside `my_value`, and method definitions are self-contained with respect to local variable. Since the outer `a` is not visible inside the `my_value` method definition, it isn’t visible inside the method invocation with a block.