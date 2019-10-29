# Arithmetic Integer
Write a program that prompts the user for two positive integers, and then prints the result of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

```
==> Enter the first number: 
23
==> Enter the second number: 
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
```

### My Solution

```rb 
def prompt(message)
	puts "==> #{message}"
end

prompt("Enter the first number:")
first_number = gets.chomp.to_i

prompt("Enter the second number:")
second_number = gets.chomp.to_i

addition = first_number + second_number
subtraction = first_number - second_number
multiplication = first_number * second_number
division = first_number / second_number
quotient = first_number % second_number
exponent = first_number ** second_number 

prompt("#{first_number} + #{second_number} = #{addition}")
prompt("#{first_number} - #{second_number} = #{subtraction}")
prompt("#{first_number} / #{second_number} = #{division}")
prompt("#{first_number} * #{second_number} = #{multiplication}")
prompt("#{first_number} % #{second_number} = #{quotient}")
prompt("#{first_number} ** #{second_number} = #{exponent}")
```

## Launch School Solution & Discussion
### Solution

```rb 
def prompt(message)
	puts "==> #{message}"
end 

prompt("Enter the first number:")
first_number = gets.chomp.to_i
prompt("Enter the second number:")
second_number = gets.chomp.to_i

prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
prompt("#{first_number} ** #{second_number} = #{first_number**second_number}"}
```

### Discussion

There are edge cases to consider in this exercise. We have to be careful of not having a second number that is zero. What if we wanted to use floats instead of integers? How does this change this problem?

Why do we have to be careful that our second number is zero? The exception that is raised when the second number is zero is this: 

```
test.rb:14:in `/': divided by 0 (ZeroDivisionError)
        from test.rb:14:in `<main>'
```

What we need to do is validate the user input. We can initialize a loop with an if/else statement. This will help us avoid this edge case. And we can handle it, like so:

**Using a loop with an if/else statement to avoid edge cases with second_number being a 0**

```rb
second_number = nil
loop do
	prompt("Enter the second number:")
	second_number = gets.chomp.to_i

	if second_number == 0
		prompt("Cannot use a zero as the second number, try again.")
	else
		break
	end
end
```

Also, if we wanted to use floats instead, we can just change the `to_i` to `to_f` instead, this will convert the user input from a whole number to a decimal number, which will allow us to use floats.

**User submitted solution that I found to be interesting aswell**

```rb
operations = %w(+ - * / % **)

puts "==> Enter the first number:"
first_num = gets.chomp.to_i
puts "==> Enter the second number:"
second_num = gets.chomp.to_i

operations.each do |operator|
  result = first_num.send(operator, second_num)
  puts "==> #{first_num} #{operator} #{second_num} = #{result}"
end
```
