# What’s My Value (Part 5)
What will the following code print, and why? Don’t run the code until you have tried to answer.

```rb 
a = "Xyzzy"

def my_value(b)
	b = "yzzyX'
end 

my_value(a)
puts a
```

The difference between this exercise and the previous exercise was that the `String#[]=` method is a mutating one. And it will make changes to the original variable. However, when we’re simply calling for a reassignment (inside of a method definition) to a string, that isn’t mutable at all. And so, when we are outputting `puts a`, we’re getting `’Xyzzy’` and not `’yzzyX’`.

## Launch School Solution & Discussion
### Solution

```rb 
"Xyzzy"
```

## Discussion

The problem is nearly identical to the previous problem, except this time we are assigning directly to the variable `b`. When `my_value` begins executing, `b` is set to reference the same string that is referenced by `a`. If we modify that string by using `b`, then that modification is reflected in `a`; it’s the same string.

However, we are not modifying that string in this exercise. Instead, we are assigning a completely new string too `b`. Assignment never changes the value of an object; instead it creates a new object, then stores a reference to that object in the variable on the left. So, at the end of `my_value`, `b` references the string `’yzzyX’`, while `a` remains unchanged: it still references `”Xyzzy”`.

So, how does this differ from `b[2] = ‘-‘`? The key difference is that this is not quite the same as object assignment; it is a call to a method named `[]=` and this method updates the string referenced by `b`; it does not change the reference, so `a` is also referencing the modified String.

To summarize, assignment to a variable (an object) never mutates the object that is referenced. However, don’t that too far: if you assign to `b[2]` like we did in the previous exercise, that’s a completely different operation; that actually mutates the content of the String referenced by `b`.