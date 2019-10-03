# What’s My Value (Part 2)
What will the following code print, and why? Don’t run the code until you have tried to answer.

```rb
a = 7

def my_value(a)
	a += 10
end 

my_value(a)
puts a 
```

At line 1 we are assigning the variable `a` to reference the integer `7`. In the method definition of `my_value` we’re passing in a single argument with the variable `a`. In this case, we’re going to get the output of `17`. When we’re calling the `my_value` method we are passing in the argument of `a` which is assigned to `7`. The method definition reads it as `7 += 10`. And so, just like the previous exercise, we’re getting `17` from the method call, but we are not mutating or reassigning the original variable `a`. And so, the output is still `7`.

## Launch School Solution & Discussion
### Solution 

```rb 
7
```

### Discussion

The problem is identical to the previous problem. The only thing we did is change the name `b` to `a`. Note that we can do this because method definitions are self-contained with respect to local variables. Local variables outside the method definition are not visible inside the method definition; so the top level `a` is not available inside `my_value`. Furthermore, local variables inside the method definition are not visible outside the method definition; so the `a` inside `my_value` is a local variable with no top-level visibility.