# Searching 101
Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

Examples: 

```
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23]

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].
```

### My Solution

```rb
def prompt(message)
	puts "==> #{message}"
end

array_of_numbers = []

prompt("Enter the 1st number:")
first_number = gets.chomp.to_i
array_of_numbers.push(first_number)

prompt("Enter the 2nd number:")
second_number = gets.chomp.to_i
array_of_numbers.push(second_number)

prompt("Enter the 3rd number:")
third_number = gets.chomp.to_i
array_of_numbers.push(third_number)

prompt("Enter the 4th number:")
fourth_number = gets.chomp.to_i
array_of_numbers.push(fourth_number)

prompt("Enter the 5th number:")
fifth_number = gets.chomp.to_i
array_of_numbers.push(fifth_number)

prompt("Enter the last number:")
last_number = gets.chomp.to_i

if array_of_numbers.include?(last_number)
	puts "The number #{last_number} appears in #{array_of_numbers}"
else
	puts "The number #{last_number} does not appear in #{array_of_numbers}"
end
```

## Launch School Solution & Discussion
```rb 
numbers = []

puts "Enter the 1st number:"
numbers << gets.chomp.to_i
puts "Enter the 2nd number:"
numbers << gets.chomp.to_i
puts "Enter the 3rd number:"
numbers << gets.chomp.to_i
puts "Enter the 4th number:"
numbers << gets.chomp.to_i
puts "Enter the 5th number:"
numbers << gets.chomp.to_i
puts "Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
```

### Other User Submitted Solutions (that I found interesting)

```rb
array = []
order = %w(1st 2nd 3rd 4th 5th)

order.each do |position|
  puts "==> Enter the #{position} number:"
  array << gets.chomp.to_i
end

puts "==> Enter the last number:"
last_number = gets.chomp.to_i

if array.include?(last_number)
  puts "The number #{last_number} appears in #{array}."
else
  puts "The number #{last_number} does not appear in #{array}."
end
```

```rb 
list_of_numbers = []

def valid_number?(number)
  number =~ /\A[-+]?[0-9]+\z/
end

def enter_number_prompt(number, order, list)
  loop do
    puts "==> Enter the #{number} number:"
    order = gets.chomp
    break if valid_number?(order)
    puts "==> Invalid input."
  end
  list << order
end

enter_number_prompt('1st', 'num1', list_of_numbers)
enter_number_prompt('2nd', 'num2', list_of_numbers)
enter_number_prompt('3rd', 'num3', list_of_numbers)
enter_number_prompt('4th', 'num4', list_of_numbers)
enter_number_prompt('5th', 'num5', list_of_numbers)
enter_number_prompt('last', 'num6', list_of_numbers)

lastnum = list_of_numbers.pop

if list_of_numbers.include?(lastnum)
  puts "==> The number #{lastnum} appears in #{list_of_numbers}."
else
  puts "==> The number #{lastnum} does not appear in #{list_of_numbers}."
end
```