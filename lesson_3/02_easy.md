# Practice Problems: Easy 2
### Question 1

In this hash of people and their age,

```rb 
ages = { "Herman" => 32, "Lily" => 30. "Grandpa" => 402, "Eddie" => 10 }
```

see if “Spot” is present.

**Bonus:** What are two other hash methods that would work just as well for this solution?

### My Solution

```rb 
puts ages.has_key?("Spot") # => False
puts ages.include?("Spot") # => False
puts ages.member?("Spot") # => False
puts ages.key? ("Spot") # => False
```

### Solution 1

```rb 
ages.key?("Spot")
```

**Bonus Answer**: `Hash#include?` and `Hash#member?`

- - - -

### Question 2
Starting with this string:

```rb 
munsters_description = "The Munsters are creepy in a good way."
```

Convert the string in the following ways (code will be executed on original `munsters_description` above):

```
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

### My Solution

```rb 
puts munsters_description.swapcase!
puts munsters_description.capitalize!
puts munsters_description.downcase!
puts munsters_description.upcase! 
```


### Solution 2

```
puts munsters_description.swapcase!
puts munsters_description.capitalize!
puts munsters_description.downcase!
puts munsters_description.upcase! 
```

- - - -

### Question 3
We have the most of the Munster family in our age hash:

```rb
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```

add ages for Marilyn and Spot to the existing hash

```rb
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

### My Solution

```rb 
puts ages.merge!(additional_ages) # => {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}
```

### Solution 3

```rb 
ages.merge!(additional_ages)
```

- - - -

### Question 4
See if the name “Dino” appears in the string below:

```rb 
advice = "Few things in life are as important as house training your pet dinosaur"
```

### My Solution 

```rb 
advice.include?("Dino")
```

### Solution 4

```rb 
advice.match?("Dino")

# Note that this is not a perfect solution, as it would match any substring with Dino in it.
```

- - - -

### Question 5
Show an easier way to write this array:

```rb 
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```

### My Solution 

```rb
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

### Solution 5

```rb 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

- - - -

### Question 6
How can we add the family pet “Dino” to our usual array:

```rb 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

### My Solution

```rb 
p flintstones.push("Dino") # => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino"]
```

### Solution 6

```rb 
flintstones << "Dino"
```

- - - -

### Question 7 

In the previous practice problem we added Dino to our array like this:

```rb 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either `Array#concat` or `Array#push` to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)

### My Solution 

```rb 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones_two = %w(Dino Hoppy)
p flintstones.push(*flintstones_two)# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino", "Hoppy"]

# Another way of solving this problem using << method...

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << "Dino" << "Hoppy" # => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino", "Hoppy"]
```

### Solution 7

```rb 
flintstones.push("Dino").push("Hoppy") # push returns the array so we can chain 
```

or 

```rb 
flintstones.conat(%w(Dino Hoppy)) # concat adds an array rather than one item
```

- - - -

### Question 8

Shorten this sentence:

```rb
advice = "Few things in life are as important as house training your pet dinosaur."
```

…remove everything starting from “house”.

Review the `String#slice!` documentation, and use that method to make the return value `”Few things in life are as important as "`. But leave the `advice` variable as `”house training your pet dinosaur."`

As a bonus, what happens if you use the `String#slice` method instead?

### My Solution

```rb 
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!("Few things in life are as important as ") # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."

# Bonus question, String#slice when we omit the exclamation point

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice("Few things in life are as important as ") # => "Few things in life are as important as "
p advice # => "Few things in life are as important as house training your pet dinosaur."

```

If we omit the `!` from the invocation of the `String#slice!` method we will have the `advice` variable return the original string value, because it has not been mutated. 

### Solution 8

```rb 
advice.slice!(0, advice.index('house'))
```

- - - -

### Question 9

Write a one-liner to count the number of lower-case ’t’ characters in the following string:

```rb
statement = "The Flintstones Rock!"
```

### Solution 9

```rb
statement.count('t')
```

- - - -

### Question 10

Back in the Stone Age (before CSS) we used spaces to align things on the screen. If we had 40 character wide table of Flintstone family members, how can we easily center that title above the table with spaces?

```rb 
title = "Flintstone Family Members"
```

### My Solution 

```rb 
title.center(40)
```

### Solution 10

```rb 
title.center(40)
```