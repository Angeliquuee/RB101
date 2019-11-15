# Practice Problems: Hard 1
### Question 1

What do you expect to happen when the `greeting` variable is referenced in the last line below?

```rb 
if false
  greeting = "hello world"
end 

greeting
```

### Solution 1

`greeting` is `nil` here, and no “undefined method or local variable” exception is thrown. Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it’s undefined. However, when you initialize a local variable with an `if` block, even if that `if` block doesn’t get executed, the local variable is initialized too `nil`.

- - - -

### Question 2

What is the result of the last line in the code below?

```rb
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

### My Solution

The variable `greetings` is referencing a hash with one key/value pair `a: 'hi'` . In the next line we are initializing a variable named `informal_greeting` that is referencing the only key/value pair in the `greetings` hash. Following that, we’re using the shovel (`<<`) operator, a mutating method, to append the string `”there"` onto that key/value pair.

Notice how I keep mentioning mutating. To explain what mutation is, it’s when the value of an object changes but its identity remains the same. 

We can tell that outputting greetings into the terminal will show `a: “hi there"` instead of `a: “hi"` and that is because the shovel operator has changed that value entirely because it behaves like a mutating method.

### Solution 2

The output `{:a=> “hi there”}`. The reason is because `informal_greeting` is a reference to the original object. The line `informal_greeting << 'there'` was using the `String#<<` method, which modifies the object that called it. This means that the original object was changed, thereby impacting the value in `greetings`. If instead of modifying the original object, we wanted to only modify `informal_greeting` but not `greetings`, there are a couple of options:

* we could initialize `informal_greeting` with a reference to a new object containing the same value by `informal_greeting = greetings[:a].clone`. 
* we can use string concatenation, `informal_greeting = informal_greeting _ ‘there'`, which returns a new `String` object instead of modifying the original object.

- - - -

### Question 3

In other practice problems, we have looked at how the scope of variables affects the modification of one “layer” when they are passed to another.

To drive home the salients aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

A) 

```rb
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

B)

```rb 
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

C)

```rb 
def mess_with_vars(one, two, three)
  one.gsub!("one", "two")
  two.gsub!("two", "three")
  three.gsub!("three", "one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

### My Solution

You have two different sets of variables named `one`, `two`, and `three`: one set is defined in the outer scope (line 7-9 in the B listing), and the other set is defined by parameters to the method on line 1. The scope of these parameters is the inner scope; the outer scope variables are completely hidden inside the method.

While the outer scope variables are hidden inside the method, the values represented by those outer scope variables are used to initialize the parameters, so the values are the same for each set of variables, and, in fact the objects are the same.

Inside the method, the only thing that happens is that inner scope variables are reassigned. *Reassignment inside a method never changes outer scope variables, so everything that happens in the method has no effect whatsoever on the final result*. This applies to be A and B.

C changes the values you use because you are using `gsub!` which mutates the object to which it is applied. Unlike reassignment, it doesn’t create a new object, but instead modifies the original object.

### Solution 3

A)

```
"one is: one"
"two is: two"
"three is: three"
```

B)

```
"one is: one"
"two is: two"
"three is: three"
```

C)

```
"one is: two"
"two is: three"
"three is: one"
```

- - - -

### Question 4

Ben was tasked to write a simply ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. “10.4.5.11”. He is not familiar with regular expressions. Alyssa supplied Ben with a method called `is_an_ip_number?` that determines if a string is a numeric string between `0` and `255` as required for IP numbers and asked Ben to use it.

```rb
def dot_separated_ip_address?(input_string)
 dot_separated_words = input_string.split(".")
 while dot_separated_words.size > 0 do
  word = dot_separated_words.pop
  break unless is_an_ip_number?(word)
 end
 return true
end
```

Alyssa reviewed Ben’s code and says “It’s a good start, but you missed a few things. You’re not returning a false condition, and you’re not handling the case that there are more or fewer than 4 components to the IP address (e.g. “4.5.5” or “1.2.3.4.5” should be invalid).”

Help Ben fix his code.

### Solution 4

There are several ways to fix this. To determine if there are exactly 4 dot-separated “words” in the string, you can simply add a check for `dot_separated_words.size` after splitting the string.

The other error in Ben’s code is that instead of returning false upon encountering a non-numeric component, he used `break` to break out of the while loop. Once he breaks, control falls through the `return true` statement. He can fix this by performing `return false` instead of `break`.

```rb 
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
```

Note: Ben’s original `return true` on the last line of the method can be shortened to just `true`. This is because Ruby returns the result of the last evaluated expression.