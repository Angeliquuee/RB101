## Practice Problems: Additional Practice
As we’ve already seen, when working with collections there are often a *number of different ways* that you can reach a solution to a particular problem. The solutions to these practice problems provide a suggestion of how each one might be solved but don’t be afraid to explore each problem in more depth, perhaps coming up wit more than one possible solution and considering the differences and trade-offs between each of them.

### Practice Problem 1

Given the array below

```rb 
flintstones = [ "Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam" ]
```

Turn this into a hash where the names are the keys and the values are the positions in the array.

### My Solution

For my solution I’m going to be using `Enumerable#each_with_index` to solve the problem.

```rb 
flintstones = [ "Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam" ]
hsh = {}

flintstones.each_with_index do |key, value|
  hsh[key] = value
end

p hsh
# => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles" =>4, "BamBam"=>5}
```

### Practice Problem 2

Add up all the ages from the Munster family hash:

```rb
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

### My Solution

```rb
p ages.values.inject(:+)
# => 6174
```

### Launch School Solution

Our solution would be to assign a variable to an initial value of `0` and then iterate through the Hash adding each value in turn to the total

```rb 
total_ages = 0
ages.each { |_, age| total_ages += age }
total_Ages # => 6174
```

Another object would be to use a `Enumerable#inject` method.

```rb 
ages.values.inject(:+) # => 6174
```

This uses `ages.values` to make an array, then uses the `inject` method which is part of the `Enumerable` module. The strange-looking parameter to inject is simply a variety of the `inject` method which says “apply the `+` operator to the accumulator and the object parameters of `inject`”.

As we have previous discussed, Enumerable is included in `Array`, and it can be useful to augment your knowledge of what you can do with arrays by studying Enumerable. When faced with a problem such as this one however, don’t get tempted to go ‘method hunting’ in order to reach a solution. As demonstrated, even if you don’t know the `#inject` method, the problem can be solved equally well by using `#each` to iterate through the Hash; you could even use a basic loop to reach the same result.

### Practice Problem 3 

In the age hash:

```rb 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

Remove people with age 100 and greater.

### My Solution

For my solution, I’m going to be using a basic loop to delete values that are over 100. As you can see, I’m iterating through my hash and checking each key, value pair on iteration. Then I have my `if` statement that has the condition `current_age > 100` which will check to see if the value is greater than 100, if so, then I’m going to delete that key from the hash.

```rb 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

names = ages.keys
counter = 0

loop do
  break if counter >= ages.size
  counter += 1
  current_name = names[counter]
  current_age = ages[current_name]
  if current_age > 100
    ages.delete(current_name)
  end
end

p ages # => {"Herman"=>32, "Lily"=>30, "Eddie"=>10, "Marilyn"=>22}
```

### Launch School Solution

```rb 
ages.keep_if { |_, age| age < 100 }
```

You could also use `#select!` here. When using similar methods however, it is important to be aware of the subtle differences in their implementation. For example, the Ruby Documentation for `Hash#select!` tells us that it is “Equivalent to `Hash#keep_if`, but returns `nil` if no changes were made”, though in this case that wouldn’t have made any difference.

### Practice Problem 4

Pick out the minimum age from our current Munster family hash:

```rb
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

### My Solution 

```rb 
p ages.values.min # => 10
```

### Practice Problem 5

In the array:

```rb
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with “Be”

### My Solution

```rb
flintstones.index { |n| n[0,2] == "Be" }
```

### Practice Problem 6

Amend this array so that the names are all shortened to just the first three characters: 

```rb 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

### My Solution

```rb 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
counter = 0
array = []

loop do
  break if counter >= flintstones.size
  current_name = flintstones[counter]
  array << current_name[0, 3]
  counter += 1
end

p array # => ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]
```

### Launch School Solution

```rb 
flintstones.map! do |name|
  name[0, 3]
end
```

This could also be done in a single line:

```rb 
flintstones.map! { |name| name[0, 3] }
```

### Practice Problem 7

Create a hash that expresses the frequency with which each letter occurs in this string:

```rb 
statement = "The Flintstones Rock"
```

ex: 

```rb 
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

### Launch School Solution

```rb 
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a 
letters.each do |letter|
  letter_frequency = statement.scan(letter).count 
  result[letter] = letter_frequency if letter_frequency > 0
end
```

### Practice Problem 8 

What happens when we modify an array while we are iterating over it? What would be output by this code?

```rb 
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1) 
end
```

What would be the output by this code?

```rb
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

### Launch School Solution

First one..

```
1
3
```

Second one..

```
1
2
```

To better understand what is happening here, we augment our loop with some additional “debugging” information:

```rb 
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index} #{numbers.inspect} #{number}"
  numbers.shift(1)
end
```

The output is:

```
"0  [1, 2, 3, 4]  1"
"1  [2, 3, 4]  3"
```

From this we see that our array is being changed as we go (shortened and shifted), and the loop counter used by `#each` is compared against the current length of the array rather than its original length.

In our first example, the removal of the first item in the first pass changes the value found for the second pass.

In our second example, we are shortening the array each pass just as in the first example.. but the items removed are beyond the point we are sampling in the abbreviated loop.

In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time.

### Practice Problem 9

As we have seen previous we can use some built-in string methods to change the size the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself `titleize`. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

```rb 
words = "the flintstones rock"
```

Would be:

```rb 
words = "The Flintstones Rock"
```

Write your own version of the rails titleize implementation.

### My Solution

```rb 
def titleize(str)
    str.capitalize!  # capitalize the first word in case it is part of the no words array
    words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but"]
    phrase = str.split(" ").map {|word| 
        if words_no_cap.include?(word) 
            word
        else
            word.capitalize
        end
    }.join(" ")
  phrase  # returns the phrase with all the excluded words
end
```

### Launch School Solution

```rb 
words.split.map { |word| word.capitalize }.join(' ')
```

### Practice Problem 10

Given the `munsters` hash below 

```rb 
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

Modify the hash such that each member of the Munster family has an additional “age_group” key that has one of the three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

```rb
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
```

**Note**: a kid is in the range 0-17, an adult is in the range 18-64 and a senior is aged 65+

**Hint**: Try using a `case` statement along with Ruby `Range` objects in your solution

### My Solution

```rb 
munsters.each do |n, d|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18..65
    details["age_group"] = "adult"
  else 
    details["age_group"] = "senior"
  end
end
```