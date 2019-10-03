# What’s My Value? (Part 1)
What will the following code print and why? Don’t run it until you have tried to answer.

```rb
a = 7

def my_value(b)
	b += 10
end

my_value(a)
puts a
```

Since the variable `a` which is referencing the integer `7` is placed lexically outside of the method definition, that would mean that the method invocation of `my_value` would be able to see the variable `a` and pass in the integer `7` as the argument.

I’m most likely sure that the return value for the method invocation of `my_value(a)` is going to be `17`, but it won’t mutate the actual variable. That will remain unchanged and when we `puts a` it will output `7`.

## Launch School Solution & Discussion
### Solution 

```rb
7
```
### Discussion 
Reassignment, including assignment operators like `+=`, does not mutate a variable; instead, it binds the variable to a new object. That is, `+=` sets the variable to point to a different object. Since line 4 binds `b` to a new object, the object pointed by `a` remains unchanged. Thus, `a` is still equal to `7` at the time of the `puts`.

Another way to look at this is that _numbers in Ruby are immutable_. Thus, there is no way for `my_value` to mutate the value referenced by `b`, which means that `my_value` does not (and can not) change the object referenced by `a` (`7`)