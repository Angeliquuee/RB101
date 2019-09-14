# Default Arguments in the Middle
Consider the following method and a call to that method:

```rb
def my_method(a, b = 2, c = 3, d)
	p [a, b, c, d]
end

my_method(4, 5, 6)
```

Use the ruby documentation to determine what this code will print.

The approach to this is that we are using the “default positional arguments” in the code above. If we invoke the method into the irb environment, or just by looking at it, we can tell that it will output the following:

```rb
[4, 5, 3, 6]
```

Here is a user submitted solution that made sense to me from a student named *Jordan Moore*:

After reading ruby-doc, it’s clear that when using default positional arguments, if one or more arguments are missing, ruby will fill them in using the given arguments from left to right. That’s why a, b, and d, get the arguments and c gets stuck with the default value.

So, because c already has a default value of 3. The integer 6 gets assigned to the variable d to fill in the spaces.

- - - -
# Launch School Solution & Discussion
Information about arguments can be found at  [http://ruby-doc.org/](http://ruby-doc.org/)  by selecting the `doc/syntax/calling_methods.rdoc` link from the core API page. If you scroll down to the Default Positional Arguments section and start reading, you will learn that ruby lets you use default arguments in the middle of a number of positional arguments, much as we are doing here. The documentation shows that positional arguments are filled out first, then the default arguments are set with any values supplied, and, finally, default values are applied to anything remaining.

In this exercises, `4`, `5` and `6` are assigned to the positional arguments `a`, `b`, and `d`. Note that `5` override the default value for `b`, but `c` is not set to any of the listed values. `c`, instead, is assigned to its default value, `3`.

In this exercise, `4`, `5`, `6` are assigned to the positional arguments `a`, `b`, and `d`. Note that `5` override the default value for `b`, but `c` is not set to any of the listed values. `c`, instead, is assigned to its default value `3`. Thus, when the results are printed, we see the results shown in our solution.

*Side note from LS*: Don’t worry too much if you don’t understand exactly how this works. This exercise is mostly concerned with where to find this information should you run into a case where it is difficult to determine how the arguments to a method are interpreted. More importantly, try not to do this in your own code; it’s hard to understand.
