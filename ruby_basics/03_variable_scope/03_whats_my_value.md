# What’s My Value (Part 3)
What will the following code print, and why? Don’t run the code until you have tried to answer.

```rb 
a = 7 

def my_value(b)
	a = b # a = 12
end 

my_value(a + 5) # 7 + 5 = 12
puts a
```

Our output is once again going to be `7`. The reason why I say this is because the local variable `a` that is declared inside of the method definition cannot be accessed outside of the method definition itself. And so, when we’re calling the method `my_value` we’re running a math operation in as an argument `7 + 5 = 12`, but as you can see, we are trying to reassign `a` to that result.  And because the `puts a` method cannot see within the scope of the `my_value` method. The variable `a` will most likely be `7` as stated in the beginning of my answer because it can only see the `a = 7` since it is placed outside of the method definition and it can scope it out and see it, rather than the reassignment happening in the method definition.

## Launch School Solution & Discussion
### Solution 

```rb 
7
```

### Discussion

Once again, the result is `7`. Once again, the local variable `a` inside `my_value` method definition is not visible outside the `my_value` method definition. Furthermore, the local variable `a` at the top level is not visible inside `my_value` because method definitions are self-contained with respect to local variables.