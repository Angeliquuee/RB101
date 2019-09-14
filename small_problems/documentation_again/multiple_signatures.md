# Multiple Signatures
What do each of these `puts` statements output?

```rb
a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }
```

First things first (*I'm the realest*), we should clarify that the %w is a shortcut for string arrays and we are applying that to our a variable. Anyways, on with the exercise..

If we take a look at the documentation for `Array#fetch` we will be granted with this beautiful explanation on what this class method will evaluate to..

- - - -

### fetch(index) → obj
### fetch(index, default) → obj
### fetch(index) {|index| block} → obj

Tries to return the element at position `index`, but throws an IndexError exception if the referenced `index` lies outside of the array bounds. This error can be prevented by supplying a second argument, which will act as a `default` value.

Alternatively, if a block is given it will only be executed when an invalid `index` is referenced.

Negative values of `index` count from the end of the array.

```rb
a = [ 11, 22, 33, 44 ]
a.fetch(1) # => 22
a.fetch(-1) # => 44
a.fetch (4, 'cat') # => "cat"
a.fetch(100) {|i| puts #{i} is out of bounds"} # => "100 is out of bounds"
```

- - - -

And with the following code that we received at the beginning of this exercise, this is what the three different method invocations will output too…

The first invocation `a.fetch(7)` will raise an exception, here is what that error looks like:

```
IndexError: index 7 outside of array bounds: -5...5
	from (irb):3:in `fetch'
	from (irb):3
	from /usr/bin/irb:11:in `<main>'
```

It seems we have an index error and that the integer 7 is out of array bounds (meaning that there is no element at the 7th index of our array). Let us take a look at the next line of code `a.fetch(7, 'beats me')` and what that might evaluate to:

```rb
puts a.fetch(7, 'beats me')
# beats me
# => nil
```

This prints ‘beats me’ because we are setting a default argument. Okay, next is `a.fetch(7) { |index| index**2 }` ..

```rb
puts a.fetch(7) { |index| index**2 }
# => 49
```

That’s weird? Why didn’t it raise an exception? I thought that there was no element placed in the 7th index of the array, and yet it outputs to the integer 49.

Even though the value does not exist, the block will still execute with the value passed as a parameter.

- - - -
# Launch School Solution & Discussion
### Solution
```
# puts a.fetch(7)
IndexError: index 7 outside of array bounds: -5...5

# puts a.fetch(7, 'beats me')
beats me

# puts a.fetch(7) { |index| index**2 }
49
```

### Discussion
The documentation for `Array#fetch` has the signatures:

*  fetch(index) → obj
*  fetch(index, default) → obj
*  fetch(index) { |index| block } → obj

This shows that `#fetch` can be called with an `index` argument, an `index` and a `default` argument, or an `index` argument and a block. Note in particular that having multiple lines in the signature is yet another way in which the ruby documentation indicates that an argument is optional. In this case, both `default` and the block are optional arguments, but they can’t be used together.

Reading the documentation, we see that `#fetch` simply returns the element of an Array by its index, but it also does bounds checking (which `Array#[]` does not); that is, it checks whether the specified element actually exists before fetching it, and raises an error if it does not exist. The second and third forms of `#fetch` prevent an error from occurring if the indicated element does not exist by providing a default value or a block that returns an appropriate value.

With this basic overview, we can tell that the first `puts` should print an error message; the second form returns the value of the default argument if the element doesn’t exist; the third form returns the value returned by the block. So, the first `puts` raises an `IndexError`, the second prints `beats me`, while the third prints `49`.
