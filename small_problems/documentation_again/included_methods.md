# Included Modules
**Note**: Ruby version 2.4.0 introduced an `Array#min` method not available in prior versions of Ruby; we wrote this exercise before that release. To follow along, please use the documentation for Ruby 2.3.0 [here](http://ruby-doc.org/core-2.3.0/Array.html).

Use irb to run the following code:

```rb
a = [5, 9, 3, 11]
puts a.min
```

Find the documentation for the `#min` method and change the above code to print the two smallest values in the `Array`.

A solution that uses the `#min` method alone requires version 2.2.0 or higher of Ruby. If you have an older version of Ruby, you need a different approach.

- - - -
# Launch School Solution & Discussion
### Solution

```rb
a = [5, 9, 3, 11]
puts a.min(2)
```

### For pre-2.2.0 versions of Ruby
```rb
a = [5, 9, 3, 11]
puts a.sort.take(2)
```

### Discussion
If you look at the `Array` documentation, you won’t find any mention of `#min`, nor will you find it in the Parent class, `Object`. It’s obvious, though, that it exists since the original code works. Where can you find the documentation for `#min`?

Some languages have a feature called **multiple inheritance**. With MI, as it’s often abbreviated, a class can inherit from two or more immediate superclasses. Inheriting from multiple superclasses, though, has pitfalls. To avoid these pitfalls, Ruby doesn’t allow MI.

Ruby uses something like MI, but without the worst of the pitfalls: **mix-in modules**. They provide a way for classes of different types to share behaviors without using inheritance.

A class can use a mix-in module by using the `include` method. Once included, all the mix-in’s methods become available to objects of the class.

One of the most commonly used mix-ins in ruby is the `Enumerable` module; it provides much of the functionality needed to iterate through collections such `Array`, `Hash`, and `Range`. If you look on the left-hand side of the documentation for the `Array` class, you will see `Enumerable` listed under the heading of Included Modules. Click on the `Enumerable` to view the `Enumerable` documentation.

Once you have the `Enumerable` documentation in front of you, scroll down to the documentation for `#min`. You can see from this documentation (you have to look at the examples) that `#min` takes an optional argument that specifies how many values it should return. In our case, we want two values, so we alter our call to `#min` by adding the argument `2`.

How do you know whether to look the Included Modules or the Parent class for methods you can’t find in the main documentation for a class? The truth is, there is no easy to tell; you need to search both until you find the documentation you need. Google can be your friend, as can the search feature on the ruby-doc.org site, but finding the right documentation isn’t easy.

If you’re using a version of Ruby older than version 2.2.0, the `#min` method does not let you select more than one minimum value. Instead, you must use an alternative approach to achieve the same result. Our alternative sorts the `Array`, then takes the first 2 elements, which will be the smallest.
