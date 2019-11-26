# Greeting
Given the code below, use a `while` loop to print `”Hello!"` twice.

```rb
def greeting
  puts 'Hello!'
end

number_of_greetings = 2
```

### My Solution

```rb 
def greeting
	puts "Hello"
end

number_of_greetings = 2

while number_of_greetings > 0
	greeting
	number_of_greetings -= 1
end

# Loop alternative
# loop do
#  number_of_greetings -= 1
#  greeting
#  break if number_of_greetings == 0
# end
```

## Launch School Solution & Discussion
### Solution

```rb
def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
```

### Discussion

Using a loop makes it easy to do something multiple times. In this case, we want to call the `greeting` method two times. To do this, we’ll make our conditional evaluate to `true` until `number_of_greetings` is less than 1. We control the value of `number_of_greetings` by subtracting 1 on each iteration. Lastly, too print `”Hello!”` we just need to invoke the `greeting` method provided to us.