# String Assignment
Take a look at the following code:

```rb 
name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
```

What does this code print out? Think about it for a moment before continuing.

If you said that the code printed 

```
Alice
Bob
```

You are 100% correct, and the answer should come as no surprise. Now, let’s look at something a bit different:

```rb
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
```

What does this print out? Can you explain these results?

### My Solution

Since the `String#upcase!` method is mutable. It will affect the original string object. My guess is that the output will print out..

```
BOB
BOB
```

## Launch School Solution & Discussion

### Solution

```
BOB
BOB
```

### Discussion

Does this result surprise you? It might, but it shouldn’t. Because assignment in ruby just assigns a reference to a variable, both `name` and `save_name` refer to the same string, `Bob`. When you apply `name.upcase!`, which mutates `name` inlace, the value that `save_name` references also changes. Thus, both `name` and `save_name` are set equal to `'BOB'`.

If you answered this question incorrectly, please take time to go back and read about Pass by Reference vs Pass by Value in Lesson 2 of Programming Foundations. To be successful with ruby, you absolutely must understand how ruby works with respect to pass by reference and pass by value.