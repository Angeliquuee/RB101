# Sum or Product Of Consecutive Integers
Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples: 

```
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.

>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
```

### My Solution

```rb
def prompt(message)
	puts ">> #{message}"
end

def compute_s(number)
	total = 0
	1.upto(number) { |value| total += value }
	total
end

def compute_p(number)
	total = 1
	1.upto(number) { |value| total *= value }
	total
end

number = 0
loop do
prompt("Please enter an integer greater than 0:")
number = gets.chomp.to_i

	if number <= 0
		prompt("That integer is not greater than 0. Please try again")
	else
		break
	end
end

prompt("Enter 's' to compute the sum, 'p' to compute the product")
calculation_choice = gets.chomp

if calculation_choice == 's'
	sum = compute_s(number)
	prompt("The sum of the integers between 1 and #{number} is #{sum}.")
elsif calculation_choice == 'p'
	product = compute_p(number)
	prompt("The product of the intgers between 1 and #{number} is #{product}.")
else
	prompt("Please choose either 's' or 'p'")
end
```

## Launch School Solution & Discussion 
### Solution

```rb 
def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end
```

### Discussion

For brevity and simplicity, our solution doesn’t try too hard to validate the user input. Your own solution probably should try to validate input and issue error messages as needed.

This solution first obtains the integer and operation to be performed from the user, then we perform the requested operation using one of two methods: `compute_sum` adds the numbers together, while `compute_product` multiplies them. Once we have the result, we just print it.

### Further Exploration

The `compute_sum` and `compute_product` methods are simple and should be familiar. A more rubbish way of computing sums and products is with the `Enumerable#inject` method. `#inject` is a very useful method, but if you’ve never used it before, it can be difficult to understand.

Take some time to read the documentation for `#inject`. (Note that all `Enumerable` methods can be used on an Array.) Try to explain how it works to yourself.

Try to use `#inject` in your solution to this problem.

### Further Exploration Solution

```rb 
def prompt(message)
	puts ">> #{message}"
end

def compute_s(array)
	array.inject(:+)
end

def compute_p(array)
	array = array - [0]
	array.inject(:*)
end

def validate_integer?(number)
  /^[0-9]*$/.match(number)
end

def validate_op(operation)
  valid_entry = %w(s p)
  valid_entry.include?(operation)
end

prompt("Please enter an integer greater than 0.")
number = gets.chomp
prompt("Enter 's' to compute the sum, 'p' to compute the product")
calculation_choice = gets.chomp.downcase

array = Array.new(number.to_i + 1){|n| n}

if calculation_choice == 's' && validate_integer?(number) && validate_op(calculation_choice)
	prompt("The sum of the integers between 1 and #{number} is #{compute_s(array)}")
elsif calculation_choice == 'p' && validate_integer(number) && validate_op(calculation_choice)
	prompt("The product of the integers between 1 and #{number} is #{compute_p(array)}")
else
	prompt("Your input is not valid, please try again.")
end
```