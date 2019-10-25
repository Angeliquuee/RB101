# Mutation
What will the following code print, and why? Don’t run the code until you have tried to answer.

```rb 
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
```

### My Solution

OK, so we have `array1` which is referencing a list of strings `Moe, Larry, Curly, Shemp, Harpo, Chico, Groucho, Zeppo`. Then in the second line, we have initialized the variable `array2` which is referencing an empty array.

Next line, we invoke the `each` method to iterate through the array of strings on `array1`. The `<<` method is mutable and therefore, `array1` and `array2` are now referencing the same list of strings.

We call the `each` method again on `array1`, but this time, we are `upcasing` strings that start with `’C’` or `’S’` this will mutate the array once more, since the `!` is appended to the `upcase` method invocation. And my guess, is that the output for `array2` will print this out:

```
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
```


## Launch School Solution & Discussion

### Solution

```
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
```

### Discussion

Wait a minute! We changed `Curly` to `CURLY`, `Shemp` to `SHEMP`, and `Chico` to `CHICO` in `array1`. How’d those changes end up in `array2` as well?

The answer lies in the fact that the first `each` loop simply copies a bunch of references from `array1`  to  `array2`. When that first loop completes, both arrays not only contain the same values, they contain the same String objects. If you modify one of those Strings, that modification will show up in both Array.

If this answer surprises you, reread the section on Pass by Reference vs Pass by Value in Lesson 2 of Programming Foundations. To be successful with ruby, you must understands how values are passed around, and what mutation means for those values.

### Further Exploration

How can this feature of ruby get you in trouble? How can you avoid it?

We can try invoking non-destructive methods instead of invoking mutable ones. Using this particular example, we *infer* that the requirements are to,

1. Copy the elements of `array1` into `array2`
2. Change certain elements in `array1` according to the first letter of that element
3. All whilst ensuring that these changes do not impact `array2`

```rb 
array1 = array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }

# reassigning `array1` to the return value of the `#map` invocation allows us
# to store in `array1`, an updated version of `array1` without having to rely
# on the destructive `#upcase!` method.

array1 = array1.map do |value|
	value.start_with?('C', 'S') ? value.upcase : value
end
```


**Did we just copy references, duplicate, mutate..?**

By analyzing the `object_id` of every element in `array1` and `array2`, we see that elements in `array1` and `array2` are, for the most part, still referencing the `String` objects *except* in those cases where the block provided to the `#map` invocation returned a new uppercase `String` object.

```rb 
array1.each { |x| puts x.object_id }
# => 17945320
# => 17945300
# => 17944940
# => 17944880
# => 17945240
# => 17944760
# => 17945200
# => 17945180

array2.each { |x| puts x.object_id }
# => 17945320
# => 17945300
# => 17945280 a new `String` object 'CURLY'
# => 17945260 a new `String` object 'SHEMP'
# => 17945240 
# => 17945220 a new `String` object 'CHICO'
# => 17945200
# => 17945180
```