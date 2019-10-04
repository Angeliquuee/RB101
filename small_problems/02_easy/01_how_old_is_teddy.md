# How old is Teddy?
Build a program that randomly generates and prints Teddy’s age. To get the age, you should generate a random number between 20 and 200.

Example Output

```
Teddy is 69 years old!
```

```rb 
age_of_teddy = rand 20..200
puts "Teddy is #{age_of_teddy} years old!"
```

## Launch School Solution & Discussion
### Approach/Algorithm

Hint: you may find the `rand` method useful. It is documented in the `Kernel` module. So, for instance, it would look like this `Kernel.rand()` without the syntactical sugar.

### Solution 

```rb 
age = rand(20..200)
puts "Teddy is #{age} years old!"
```

### Discussion

Our solution uses `Kernel#rand` with a range `(20..200)` as an argument. This use is described in the documentation for `rand`, although it is kind of an afterthought.

Nevertheless, the use of a range to limit the output value is an enormous help here, so we use it to generate Teddy’s age. Afterward, all we have to do is print the result.

### Further Exploration

Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use “Teddy” as the name if no name is entered.

```rb 
puts "=> Please enter your name:"
name = gets.chomp.capitalize

if name == ""
  name = "Teddy"
end

age = rand(20..200)

puts "=> Hello #{name}, you are #{age} years old!"
```