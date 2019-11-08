# Practice Problems: Medium 1
### Question 1

Let’s do some “ASCII Art” (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

```
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```

### Solutions

**My Solution**

```rb 
10.times { |space| puts (" " * space) + "The Flintstones Rock! "}
```

**Launch School Solution**

```rb
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
```

- - - -

### Question 2

The result of the following statement will be an error:

```rb 
puts "the value of 40 + 2 is " + (40 + 2)
```

Why is this and what are two possible ways to fix this?

### Solutions

**My Solution**

If we run the code an exception will be raised, the message in the stack states that there is `no implicit conversion of Fixnum into String (TypeError)`. This message simply means that we cannot concatenate an integer to a string in Ruby. For it to be properly outputted, we must turn that integer into a string. And we can simply fix this in two possible ways:

1. Using String Interpolation

```rb
puts "the value of 40 + 2 is #{40 + 2}"
``` 

2. Converting the mathematical operation `(40 + 2)` into a string using the `#to_s` method 

```rb 
puts "the value of 40 + 2 is " + (40 + 2).to_s
```

**Launch School Solution**

This will raise an error `TypeError: no implicit conversion of Fixnum into String` because `(40 + 2)` results in in an integer and it being concatenated to a string.

To fix this either call

```rb 
(40+2).to_s
```

Or use string interpolation:

```rb
puts "the value of 40 + 2 is #{40 + 2}"
```

- - - -

### Question 3

Alan wrote the following method, which was intended to show all of the factors of the input number: 

```rb 
def factors(number)
  divisor = number
  factors = []
  begin 
   factors << number / divisor if number % divisor == 0
   divisor -= 1 
  end until divisor == 0
  factors
end
```

Alyssa noticed that this will fail if the input is `0`, or a negative number, and asked Alan to change the loop. How can you make this work without using `begin`/ `end`/ `until`? Note that we’re not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

**Launch School Solution**

We’re omitting the `begin`/ `end`/ `until` so in this solution we’re going to be putting a `while` condition in the loop instead: 

```rb
divisor = number
factors = []

while divisor > 0 do 
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end
```


**Bonus 1**

What is the purpose of the `number % divisor == 0`?

Allows you to determine if the result of the division is an integer number that has no remainder.

**Bonus 2**

What is the purpose of the second-to-last line (`line 8`) in the method (the `factors` before the method’s `end`)?

This is what the actual return value from the method. Recall that without can explicit `return` statement in the code, the return value of the method is the last statement executed. If we omitted this line, the code would execute, but the return value of the method would be `nil`.

**Breaking it down**

* `divisor` is set to `number` *before* the loop begins. So, yes, on the first iteration e check if a number is divisible by itself! This is a requirement when looking for factors (the goal of this exercise) as, for example, 5 is considered a factor of 5.
* On each iteration we *decrement* the divisor by one. This is what the `divisor -= 1` is doing, as you said. We basically check every number, starting from the number itself down to 1, and we stop iterating when our divisor is equal to `0`.
* The `begin..end` goes together with the `until` keyword and forms a looping construct. It is not very common, so don’t worry if you forgot about it. The important thing is to now understand how it works. In this case, it is not ideal, since it will fail if the input is `0`. That’s why the proposed solution uses `while`.

To understand this exercise, we have to be clear on what’s a *factor*: numbers we can multiply to get another number. For example `2` and `3` are factors of `6`, while `4` is not. A good way to check is to use the modulo operator (`%`) as it will return the remainder of a division: 

```
irb(main):011:0> 6 % 2
=> 0
irb(main):012:0> 6 % 3
=> 0
irb(main):013:0> 6 % 4
=> 2
```

- - - -

### Question 4

Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, “Take your pick. Do you like `<<` or `+` for modifying the buffer?”. Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

```rb
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer 
end 

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer 
end
```

**Launch School Solution**

Yes, there is a difference. While both methods have the same return value, in the first implementation, the input argument called `buffer` will be modified and will end up being changed after `rolling_buffer1` returns. That is, the caller will have the input array that they pass in be different once the call returns. In other implementation, `rolling_buffer2` will not alter the caller’s input argument.

- - - -

### Question 5

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable?

```rb 
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

How would you fix this so that it works? 

**My Solution**

To understand why the program complained as soon as it is run, we’re going to refer back to the concept of variable scoping. Ben created a method definition and when he did that that he was actually creating a new scope within his program. When we run this program we get the following error: `undefined local variable or method ‘limit' for main:Object (NameError)`. This is because a method definition cannot access local variables in another scope.

In this case, the variable `limit` cannot be detected by the method definition. To easily fix this, we must declare `limit` outside of the method definition. In the example below, I chose it to point to `nil` because it is a special value reserved to indicate the absence of a value since we are going to reassign it within the definition. And because we want this variable to be detected inside of the method definition I initialized it inside of the method definition’s scope.

```rb
limit = nil

def fib(first_num, second_num)
	limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

After refactoring the code, we can properly run the program now and it will output `result is 13`.

**Launch School Solution**

Ben defines `limit` before he calls `fib`. But `limit` is not visible in the scope of `fib` because `fib` is a method and does not have any access to any local variables outside of its scope.

You can make `limit` an additional argument to the definition of the `fib` method and pass it when you all `fib`.

**Side Note**

Launch School has a different approach to this solution and it’s *actually* way better than what I thought of haha. Anyways, I completely forgot that you can pass in objects inside of the parameters of method definitions. And their solution described would look something like this:

```rb
def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"
```

And it would still work the same way and way more efficiently than the solution I provided. Thumbs up for me trying though. Hehe.

- - - -

### Question 6

What is the output of the following code?

```rb 
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

**My Solution**

This is a tricky question. But this code will actually output 34. The method definition doesn’t hold any mutating operators. And so the object that the variable answer is pointing at will remain the same.

- - - -

### Question 7

One day Spot was playing the Munster family’s home computer and he wrote a small program to mess with their demographic data:

```rb 
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following..and before Grandpa could stop him, he hit the Enter key with his tail:

```rb
mess_with_demographics(munsters)
```

Did the family’s data get ransacked? Why or why not?

**Launch School Solution**

Spot will find himself in the “dog” house for this one. The family’s data is all in shambles now.

Why? Remember that in Ruby, what gets passed in the parameter list is not what it appears. Under the hood, Ruby passes the object id of each item rather than the value of the parameter. The method internally stores these object id’s in locally scoped (private to the method) variables (named per the method definition’s parameter list).

So Spot’s `demo_hash` starts off pointing the `munsters` hash. His program could wind up replacing that with some other object id and then the family’s data would be safe.

In this case, the program does not reassign `demo_hash` — it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the `munsters` hash.

- - - -

### Question 8

Method calls can take expressions as arguments. Suppose we defined a method called `rps` as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie?

```rb 
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?

```rb 
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

**My Solution**

To simply explain, we will first try to break this down by seeing what the innermost expressions evaluate too. In this case, we try to see what the return value of `rps(“rock”, “paper”)` and `rps(“rock”, "scissors”)` is. 

`rps(“rock”, “paper”)` will evaluate to `paper` and `puts rps(“rock", “scissors”)` will evaluate too `”rock"`. And now the invocation can be looked at like this.. 

```rb
puts rps(rps("paper", "rock"), "rock")
```

If we break it down once more, `rps(“paper”, “rock”)` will obviously evaluate to `"paper"` and then it’ll start looking like this:

```rb 
puts rps("paper", "rock")
```

And boom, that’s how we get our answer.. the winner is obviously `"paper"` and so it will return `”paper”`.

**Launch School Solution**

```
"paper"
```

The outermost call is evaluated by determining the result of `puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")` versus `rock`. In turn that means we need to evaluate the two separate results of `rps(“rock”, “paper”)` and `rps(“rock”, “scissors”)` and later combine them by calling ups on their individual results. Those innermost expressions will return `”paper"` and `"rock"`, respectively. Calling rps on that input will return `"paper"`. Which finally when evaluated against `"rock"` will return `”paper”`.

- - - -

### Question 9

Consider these two simple methods:

```rb 
def foo(param = "no")
  "yes"
end 

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

```rb 
bar(foo)
```

**My Solution**

In the first method definition `foo`, we are setting a default parameter `(param = “no”)` . By defining our method with default arguments, we make it possible to call the method with optional arguments, i.e. with or without arguments. We are then implicitly returning the string object `”yes"` within the definition, since it is going to be the last value Ruby evaluates.

In the second method definition `bar`, we are also setting it with the same default parameter. Inside of this method definition, we are using a ternary operator.

A ternary operator’s template looks like this:

```rb
condition ? true : false
```

So, using this template we can refactor the code to be a little more understandable using `if/else` since ternary operators are just shorthands for `if/else` statements anyways.

```rb 
if param == "no"
  "yes"
else 
  "no"
end
```

The question asks, what would be the return value of the following method invocation?

```rb
bar(foo)
```

To put it clearly, we are passing in the method definition `foo` inside of the method `bar` which, as mentioned before, implicitly returns the value `”yes"`. So it can be seen as this:

```rb
bar("yes")
```

And going off of the `if/else` statement or  the ternary operator that is given to us, the parameter would evaluate to `”no”` because the condition `param == “no”` is not true, since the argument passed in is `”yes”`.

**Launch School Solution**

```
"no"
```

This is because the value returned from `foo` method will always be `”yes"`, and `”yes” == “no"` will be `false`.