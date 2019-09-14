# Parent Class
Use irb to run the following code:

```rb
s = 'abc'
puts s.public_methods.inspect
```

You should find that it prints a list of all the public methods available to the String `s`; this includes not only those methods defined in the `String` class, but also methods that are inherited from `Object` (which inherits other methods from the `BasicObject` class and the `Kernel` module). That’s a lot of methods.

How would you modify this code to print just the public methods are defined or override by the `String` class? That is, the list should exclude all members that are only defined in `Object`, `BasicObject`, and `Kernel`.

- - - -
# Launch School Solution & Discussion
### Solution
```rb
s = 'abc'
puts s.public_methods(false).inspect
```

### Discussion
If you look at the `String` documentation you won’t find any mention of `#public_methods`. However, it is clearly available: it runs in our example. How is that? Where do you need to go to find the documentation `#public_methods`?

The issue here is that ruby is an object oriented language. Everything is an object, which means that everything has an associated class, and that class in turn has a superclass, or a parent. Every class that inherits from a superclass also inherits from all of its methods.

In the `String` documentation, if you look at the “Parent” box on the left side, you will see that the parent of the `String` class is `Object`; in fact, this is true for most classes in the ruby documentation. What this means for the `String` class, though, is that `String` inherits from `Object`, so every method in `Object` is also available in `String`, though perhaps in modified form.

Since `#public_methods` is not described in the `String` documentation, we obviously must look elsewhere. One of two additional places you can look for method descriptions is in the documentation for the parent. Go ahead and click `Object` in the Parent box to go to the `Object` class documentation.

Sure enough, there’s `#public_methods` (make sure you don’t select `#public_method`) over on the left hand side under Methods. Go ahead click `#public_methods` to scroll down to the documentation for the method.

Once you have the documentation in front of you, you can see that the `#public_methods` takes an optional argument `all`. If that value is `true` or omitted, it returns a list of all public methods available to the object (our `s` String in this case); if `all` is `false`, `#public_methods` limits the output to just those methods in “the receiver” (that’s the object that called `#public_methods`); for our purposes, this means just the methods defined directly in the `String` class.

Thus, our solution to the exercise is to modify the second line of code to include a `false` argument for `#public_methods`.

The phrase “though perhaps in modified form” from above is there because a class can override the members of its superclass. In fact, most of the Core and Standard Library API classes do just that. For example, `String` override `Object#==`. What this means for you is that you must first look at the documentation for you class before looking at the documentation for the superclass. Even if you know that the superclass has a particular method, you should always check that it isn’t being overridden by the subclass.
