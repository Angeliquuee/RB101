# What’s My Value (Part 9)
What will the following code print, and why? Don’t run the code until you have tried to answer.

```rb 
a = 7 
array = [1, 2, 3]

array.each do |a| # we can avoid variable shadowing if we changed this to b
	a += 1 
end

# if we changed it to b, then the reassignment will actually happen and it will output 4

puts a
```

When Ruby goes looking for a variable `a`, it first looks within that `each` block and when it does find that variable, it will stop looking. It will never see that we’ve initialized in an outer scope. Because we know our outer local variable `a` goes untouched we can expect it to output the same value it was initialized to on Line 1.

To avoid variable shadowing, we need to use unique names. It’s important to note that the `each` method isn’t going to mutate our original array, it will only return the original array. 

## Launch School Solution & Discussion
### Solution

```rb 
7
```

## Discussion

This problem demonstrates _shadowing_. Shadowing occurs when a block argument hides a local variable that is defined outside the block. Since there outer `a` is shadowed, the `a += 1` has no effect on it. In fact, that statement has no effect at all. 