# Practice Problems: Medium 2
### Question 1

Every named entity in Ruby has an `object_id`. This is a unique identifier for that object.

It is often the case that two different things “look the same”, but they can be different objects. The “under the hood” object referred to by a particular named-variable can change depending on what is id one to that named-variable.

In other words, in Ruby everything is an object.. but it is not always THE SAME object.

Predict how the values and object ids will change throughout the flow of the code below:

```rb 
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end
```


### Solution 1

```
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 2152729580 before the block.
c_outer is [42] with an id of: 2152729540 before the block.
d_outer is 42 with an id of: 85 before the block.
```

Notice that Ruby re-used the “42 object with id 85” when the value was the same.

```
a_outer id was 85 before the block and is: 85 inside the block.
b_outer id was 2152729580 before the block and is: 2152729580 inside the block.
c_outer id was 2152729540 before the block and is: 2152729540 inside the block.
d_outer id was 85 before the block and is: 85 inside the block.
```

Notice that Ruby did NOT change the id for any objects between outside and inside the block

```
a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 2152729580 before and: 2152728320 after.
c_outer inside after reassignment is [44] with an id of: 2152729540 before and: 2152728280 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
```

Notice that changing the values has forced Ruby to create new objects and refer to them with the original variable names.

```
a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
b_inner is thirty three with an id of: 2152728320 inside the block (compared to 2152728320 for outer).
c_inner is [44] with an id of: 2152728280 inside the block (compared to 2152728280 for outer).
d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).
```

Notice that Ruby re-uses the objects under the hood when it can, but uses different ones for different values.

```
a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
b_outer is thirty three with an id of: 2152729580 BEFORE and: 2152728320 AFTER the block.
c_outer is [44] with an id of: 2152729540 BEFORE and: 2152728280 AFTER the block.
d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.
(notice that each variable keeps its new object/object_id even when we leave the block.)

 => "ugh ohhhhh"
```

Notice that once we leave the block, those variables that were defined inside the block loose their meaning.

- - - -

### Question 2

Let’s look at the object id’s again from the perspective of a method call instead of a block.

Here we haven’t changed ANY of the code outside or inside of the block/method. We simply took the contents of the block from the previous practice problem and moved it to a method, to which we are passing all of our outer variables.

Predict how the values and object ids will change throughout the flow of the code below:

```rb
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end
```

### Solution 2

```
a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 2152753560 before the block.
c_outer is [42] with an id of: 2152753540 before the block.
d_outer is 42 with an id of: 85 before the block.
```

Notice that this works the same as before. No big surprise.

```
a_outer id was 85 before the method and is: 85 inside the method.
b_outer id was 2152753560 before the method and is: 2152753560 inside the method.
c_outer id was 2152753540 before the method and is: 2152753540 inside the method.
d_outer id was 85 before the method and is: 85 inside the method.
```

This is also the same as before. These “outers” are NOT the same variables as those outside, Ruby is simply re-using the objects, as these new variables have the same values as the ones outside.

```
a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 2152753560 before and: 2152752300 after.
c_outer inside after reassignment is [44] with an id of: 2152753540 before and: 2152752280 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
```

As before with the block version of this practice problem, when we change the values of our “outers”, Ruby uses new objects for these variables to deal with their new values.

One important difference to note is that before, we saw Ruby re-using the “42” object and just giving it a new value inside the block. Why the difference? It should become clear a couple paragraphs later in this solution…

```
a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
b_inner is thirty three with an id of: 2152752300 inside the method (compared to 2152752300 for outer).
c_inner is [44] with an id of: 2152752280 inside the method (compared to 2152752280 for outer).
d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).
```

No big surprise here… Ruby is re-using objects that have the same values..

```
a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
b_outer is forty two with an id of: 2152753560 BEFORE and: 2152753560 AFTER the method call.
c_outer is [42] with an id of: 2152753540 BEFORE and: 2152753540 AFTER the method call.
d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
```

Wow, look at that. Even though we changed the values of our “outer” variables inside the method call, we still have the same values and the same object id’s down here AFTER the method call as we had before it!

This is because our method call accepts VALUES as parameters. The names we give to those values in the definition our method are SEPARATE from any other ruse of the same names.

We use the same names there for convenience (and admittedly to build some suspense and allow us to clarify this point). We could just as easily have called the first parameter of our method definition `a_Fred` instead of `a_outer`.

The method gets the VALUES of the parameters we pass, but the parameter variables inside the method have no other relationship to those outside of the method. The names were coincidental, and confusing in a useful way.

```
=> "ugh ohhhhh"
```

Our main method STILL has no access to variables that are defined inside of the method.

- - - -

### Question 4

To drive that last one home… let’s turn the tables and have the string show a modified output, while the array thwarts the methods efforts to modify the caller’s version of it.

```rb
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end 

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string_, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

### My Solution

Breaking it down, we’re going to be using the `<<` shovel operator on our string parameter in this method. When we’re using the shovel operator on two strings, it’ll join those two together to create one string, for example:

```rb
"hello" << "hi"
# => "hellohi"
```

And in this case, outside of the method definition, we are initializing two variables and these variables are called `my_string` and `my_array`. As we know, the shovel operator is a mutating method and so it will affect the original object it is referring to.

In this case, we’re going to be using `my_string` and `my_array` as params. When we pass these into the method definition the `my_string` should look like this:

```rb
my_string = "pumpkins"
my_string << 'rutabaga'
# => "pumpkinsrutabaga"
```

As demonstrated above in our “hello hi” example, it will output like so. But what about our array parameter? By observing the output, we can see that we’re performing a reassignment and the original array defined in our method remains unchanged. It’s just pointing to a different array now, which is `["pumpkins"]`

### Solution 4

```
My string looks like this now: pumpkinsrutabaga
My array looks like this now: ["pumpkins"]
```

As you can see, we have achieved the opposite effect from our last example.

We are still passing in the same two string and array parameters, but the results are the opposite, because our method does the “same thing” to each, but in a different way than before. That is, in both cases, the method attempts to change the string from `”pumpkins"` to `”pumpkinsrutabaga"` and add `”rutabaga"` to the array.

Despite the similarity of the results *inside* the method definition, the results outside the method definition are opposite.

As before, the explanation is all about what Ruby does with local variables when we change the object it points to. Does it create a new local variable? Or is it able to just modify the existing object?

With the `Array#=` assignment, our literal `[‘pumpkins’, ‘rutabaga’]` array is a **new object** and we are assigning it to the local variable `an_array_param`.

- - - -

### Question 5

Depending on a method to modify its arguments can be tricky:

```rb 
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end 

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

Whether the above “coincidentally” does what we think we wanted “depends” upon what is going on inside the method.

How can we refactor this practice problem to make the result easier to predict for the next programmer to maintain?

### My Solution

Focusing on the code before the refactor, let’s see how this method behaves first. The `+=` operator used on `a_string_param` will not make any changes unlike the shovel operator.

As for the array parameter, we’re appending the string “rutabaga” into the array. And so the output will look like so:

```
My string looks like this now: pumpkins
My array looks like this now: ["pumpkins", "rutabaga"]
```

I’m guessing if I had to refactor this code, it would be to fix the line where it incorporates the usage of the shovel operator for the array parameter, it is in best practice to avoid mutating methods as they can cause problems later on. I can simply just use `+=`  to append the string “rutabaga” to the array instead.

```rb
def refactored_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += "rutabaga"
end 
```

### Solution 5

```rb
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

Every language (Ruby included) provides ways and means of writing “clever” code that depends on some of the less obvious traits of the language.

Every good programmer practices these tricks… and then avoids them like the plague.

Clever programmers don’t write “clever” code. They write explicit code that is easy to read, debug, and modify as the requirements change.

- - - -

### Question 6

How could the unnecessary duplication in this method be removed?

```rb 
def color_valid(color)
  if color == "blue" || color == "green"
   true 
  else 
   false
  end
end
```

### Solution 6

```rb
def color_valid(color)
  color == "blue" || color == "green"
end
```