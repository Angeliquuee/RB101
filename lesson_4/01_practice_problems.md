## Practice Problems: Methods and More Methods
The goal for these practice problems is to gain a deep understanding of specific concepts, not to rush through them.

### Practice Problem 1

What is the return value of the `select` method below? Why?

```rb 
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

### My Solution

From what we’ve learned, we know that `select` evaluates the **return value of the block**. The return value of the block is the return value of the last expression within the block and that `select` only cares about its truthiness. We know that the string `’hi’`(the last line evaluated in the block) counts as a “truthy” value because it doesn’t return `false` or `nil`, this means that `select` will start gathering the elements in the array that it was called on and return a new collection.  So, the answer would to this question would be

```rb
# => [1, 2, 3]
```

### Launch School Solution

```rb 
# => [1, 2, 3]
```

`select` performs selection based on the *truthiness* of the block’s return value. In this case the return value will always be `’hi'`, which is a “truthy” value. Therefore `select` will return a new array containing all of the elements in the original array.

### Practice Problems 2 

How does `count` treat the block’s return value? How can we find out?

```rb 
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

### My Solution

According to the Ruby documents, the `Array#count` method returns the number of elements. If a block is given, it will count the number of elements for which the block returns a true value. So using this information, we would know that this particular piece of code will return:

```
# => 2
```

This will return `# => 2` because there are two conditions from the collection that match `str.length < 4` and it’s `[‘ant’, ‘bat’]` because they are true in which both have less than 4 characters, while `[‘caterpillar’]` is false and doesn’t have less than 4 characters.

### Launch School Solution

If we don’t know how `count` treats the block’s return value, then we should consult the docs for `Array#count`. Our answer is in the description:

If a block is given, counts the number for which the block returns a true value.

Based on this information, we can conclude that `count` only counts an element if the block’s return value evaluates to `true`. This means that `count` considers the *truthiness* of the block’s return value (sort of like `select`).

### Practice Problem 3

What is the return value of `reject` in the following code? Why?

```rb 
[1, 2, 3].reject do |num|
  puts num 
end 
```

### My Solution

Consulting the Ruby documentation once more, we can see that the `Array#reject` method that has a block attached to it will return an array for all elements of `enum` for which the given `block` returns `false`.

In this case, we’re going to have a return value of…

```rb
# => [1, 2, 3]
```

Because we are utilizing the `puts` method and that method will always return `nil` (which is a “falsey” value) then it will be selected. 

### Launch School Solution

```
# => [1, 2, 3]
```

Since `puts` always returns `nil`, you might think that no values would be selected and an empty array would be returned. The important thing to be aware of here is how `reject` treats the return value of the block. `reject` returns a new array containing items where the block’s return value is “falsey”. In other words, if the return value was `false` or `nil` the element would be selected.

### Practice Problem 4

What is the return value of `each_with_object` in the following code? Why?

```rb 
['ant', 'bear', 'cat'].each_with_objects({}) do |value, hash|
  hash[value[0]] = value 
end
```

### Launch School Solution

```rb 
# => { "a" => "ant", "b" => "bear", "c" => "cat" }
```

Based on our knowledge of `each`, it might be reasonable to think that `each_with_object` returns the original collection. That isn’t the case, though. When we invoke `each_with_object`, we pass in an object (`{}` here) as an argument. That object is then passed into the block and its updated value is returned at the end of each iteration. Once `each_with_object` has iterated over the calling collection, it returns the initially given object, which now contains all of the updates.

In this code, we start with the hash object, `{}`. On the first iteration, we add `”a” => “ant”` to the hash. On the second, we add `”b” => “bear"`, and on the last iteration, we add `”c” =? “cat"`. Thus, `#each_with_object` in this example returns a hash with those 3 elements.

### Practice Problem 5

What does `shift` do in the following code? How can we find out?

```rb 
hash = { a: 'ant', b: 'bear' }
hash.shift
```

### My Solution

If we consult the Ruby documentation for the method `shift`, we will get the description “Removes a key-value pair from *hsh* and return it as the two-item array [ *key*, *value* ] or the hash’s default value if the hash is empty.

So, in this case, it will remove the first key-value pair `a: 'ant'` and then return `[:a, ‘ant’]`. From examination, this is a mutating method, and so it will make permanent changes to the initial hash that it was called upon.

### Launch School Solution

`shift` destructively removes the first key-value pair in `hash` and returns it as a two-item array. If we didn’t already know how `shift` worked, we could easily learn by checking the documentation for `Hash#shift`. The description for this method confirms our understand.

There are quite a few Ruby methods, and you’re not expected to know them all. That’s why knowing how to read the Ruby documentation is so important. If you don’t know how a method works you can always check the documentation.

### Practice Problem 6

What is the return value of the following statement? Why?

```rb 
['ant', 'bear', 'caterpillar'].pop.size
```

### My Solution

We can tell from this code that we are method chaining and that the `size` method is being called upon the return value of `[‘ant’, ‘bear’, ‘caterpillar’].pop`. If we navigate over to the documentation it states that the method `Array#pop` removes the last element from `self` and returns it, or `nil` if the array is empty. In this case, the initial method call is going to return `'caterpillar'` as it is the last element in the collection.  When we are invoking the method size, we’re actually calling it upon the return value (which is `’caterpillar'`). According to `String#size` the return value is going to be the character length of *str* and `'caterpillar'` has a total of 11 characters.

```rb 
# => 11
```

### Launch School Solution

```rb 
# => 11
```

There are a couple things going on here. First, `pop` is being called on the array. `pop` destructively removes the last element from the calling array and returns it. Second, `size` is being called on the return value by `pop`. Once we realize that `size` is evaluating the return value of `pop` (which is `”caterpillar"`) then the final return value of `11` should make sense.

### Practice Problem 7

What is the **block’s** return value in the following code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?

```rb
[1, 2, 3].any? do |num|
  puts num 
  num.odd?
end 
```

### My Solution

The `Enumerable#any?` method returns `true` if the block ever returns a value other than `false` or `nil`. If the block is not given, Ruby adds an implicit block of `{ |obj| obj }` that will cause `any?` to return `true` if at least one of the collection members is not `false` or `nil`.

Because the last expression evaluated in this block is `num.odd?` which would return true if the `int` is an odd number. The first number in the array would cause the `num.odd?` method to evaluate to `true` on the first iteration.

### Launch School Solution

The return value of the block is determined by the return value of the last expression within the block. In this case the last statement evaluated is `num.odd?`, which returns a boolean. Therefore the block’s return value will be a boolean, since `Fixnum#odd?` can only return `true` or `false`. 

Since the `Array#any?` method returns `true` if the block ever returns a value other than `false` or `nil`, and the block returns `true` on the first iteration, we know that `any?` will return `true`. What is also interesting here is `any?` stop iterating after this point since there is no need to evaluated the remaining items in the array; therefore, `puts num` is only ever invoked for the first item in the array: `1`.

### Practice Problem 8

How does `take` work? Is it destructive? How can we find out?

```rb 
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

### My Solution 

`Array#take` will return the first `n` elements from the array. If a negative number is given, it raises an exception. In this case, it will return the first 2 (because that is the `n` argument) elements in the Array collection. 

```rb
# => [1, 2]
```

It is not destructive, if we place our code in the irb environment we can see that there will be no mutations made upon the array that the `Array#take` method is called upon.

```
irb(main):001:0> arr = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
irb(main):002:0> arr.take(2)
=> [1, 2]
irb(main):003:0> arr
=> [1, 2, 3, 4, 5]
```

### Launch School Solution

If you’re unsure of how a method works the best thing to do is read its documentation (duh). Along with that, testing the method in `irb` can be very helpful. In this case we can quickly check if `take` is destructive or not by running the code in `irb`.

```
irb :001 > arr = [1, 2, 3, 4, 5]
irb :002 > arr.take(2)
=> [1, 2]
irb :003 > arr
=> [1, 2, 3, 4, 5]
```

By reading the docs and testing the method in `irb`, we’re able to determine that `Array#take` selects a specified number of elements from an array. We’re also able to verify that it is not a destructive method.

### Practice Problem 10

What is the return value of `map` in the following code? Why?

```rb 
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

### My Solution

We know that `map` uses the return value of the block to perform transformation. Map will **return a new array** with the results. It is not destructive, if you wanted to change the original array, you could use `map!`.

Within the block, we are returning values that have more than 3 characters. So in this case, the last thing being returned is `bear’` within the `if` statement.  Since `bear` is the only statement within the block, the return value of the block is `bear'`, which `map` will use as the transformation criteria. Therefore, the above code will return an array where each element is `'bear'`.

### Launch School Solution

```rb 
# => [nil, "bear"]
```

There are some interesting things to point out here. First, the return value of `map` is an array, which is the collection type that `map` always returns. Second, where did that `nil` come from? If we look at the `if` condition (`value.size > 3)`), we’ll notice that it evaluates to `true` when the length of `value` is greater than `3`. In this case, the only value with a length greater than `3` is `'bear'`. This means that for the first element, `’ant’`, the condition evaluates to `false` and `value` isn’t returned.

When none of the conditions in an `if` statement evaluates as `true`, the `if` statement itself returns `nil`. That’s why we see `nil` as the first element in the returned array.

### Practice Problem 10

What is the return value of the following code? Why?

```rb 
[1, 2, 3].map do |num|
  if num > 1 
    puts num 
  else 
    num 
  end 
end 
```

### My Solution 

Knowing what we know from the previous question, we know that `Array#map` will return a new array with the results stored inside of it. In the block, we are reading through an `if/else` statement. The condition is outputting the `num` through the `puts` method if it is greater than `1`. On the first iteration, the number is equal to `1`, so, it’s going to just return the integer `1`. And our solution would look like this so far:

```rb
# => [1]
```

On the second iteration, `2` is definitely greater than `1`, however, we are outputting the value with `puts` and we know that `puts` always returns `nil`, so then the solution would look like this after the second iteration:

```rb
# => [1, nil]
```

The same thing applies for the last element in the collection which is `3`, so essentially the answer to this question would be:

```rb
# => [1, nil, nil]
```

### Launch School Solution

We can determine the block’s return value by looking at the return value of the last statement evaluated within the block. In this case it’s a bit tricky because of the `if` statement. For the first element, the `if` condition evaluates to `false`, which means `num` is the block’s return value for that iteration. For the rest of the elements in the array, `num > 1`, evaluates to `true`, which means `puts num` is the last statement evaluated, which in turn, means that the block’s return value is `nil` for those iterations.

Therefore, the return value of `map` is:

```rb 
# => [1, nil, nil]
```

### Summary

After completing these practice problems, you’ve hopefully been able to further solidify your knowledge and understanding of the concepts. The key things to think about are:

* How does the method treat the block’s return value?
* What is the return value of the method?
* How can you use the Ruby docs to learn more about a method?
* Is the method destructive?