# Mandatory Blocks
The `Array#bsearch` method is used to search ordered `Array`s more quickly than `#find` and `#select` can. Assume you have the following code:

```rb
a = [1, 4, 8, 11, 15, 19
```

How would you search this `Array` to find the first element whose value exceeds `8`?

To find the first element whose value exceeds `8` we must invoke the `Array#bsearch` method onto the array that we initialized in the code above, here is what that would look like:

```rb
a.bsearch { |n| n > 8 }
# => 11
```

According from this [documentation](https://www.rubydoc.info/stdlib/core/Array:bsearch), we are using binary search to find a value from the array which meets the given condition in O(log n) where n is the size of the array.

This documentation will cover ground on how to use this method in two cases:
1. Find-minimum mode
2. Find-any mode

In either case, the elements of the array must be monotone (or sorted) with respect to the block.

- - - -

# Launch School Solution & Discussion
### Solution

```rb
value = a.bsearch { |element| element > 8 }
puts value # => 11
```

### Discussion
The documentation for `Array#bsearch` has the signature:

* bsearch {|x| block} → elem

This signature shows that `#bsearch` takes only one argument - a block - and returns an element of the `Array` to which it is applied. We can also see that the block is required, and that it takes one argument. The text and examples below the signature and show us that the block must return `true` or `false` when operating in what is called “find-minimum mode”, which is the usual use case.

Putting this all together, we can devise our call to `#bsearch`: we use `a` as the caller, a block of `{ |element| element > 8 }` to find the first element whose value is greater than 8, and we store the return value to a variable named `value`. The value of `value` is then printed, which shows that `#bsearch` found the `11` in `a`.

For more information on what `#bsearch` does and why it is faster, see the Wikipedia article on the [Binary search algorithm](https://en.wikipedia.org/wiki/Binary_search_algorithm). `#bsearch` uses this algorithm.
