# Launch School Printer (Part 1)
Write a program that prints `’Launch School is the best!’`repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.

For now, just use `#to_i` to convert the input value to an Integer, and check that result instead of trying to insist on a valid number; validation of numeric input is a topic with a fair number of edge conditions that are beyond the scope of this exercise.

Examples:


```
>> How many output lines do you want? Enter a number >= 3:
5
Launch School is the best!
Launch School is the best!
Launch School is the best!
Launch School is the best!
Launch School is the best!

>> How many output lines do you want? Enter a number >= 3:
2
>> That's not enough lines.
>> How many output lines do you want? Enter a number >= 3:
3
Launch School is the best!
Launch School is the best!
Launch School is the best!
```

### My Solution

```rb 
def prompt(message)
  puts ">> #{message}"
end

number_of_lines = nil
loop do
  prompt("How many output lines do you want? Enter a number >= 3:")
  number_of_lines = gets.to_i
  break if number_of_lines >= 3
  prompt("That's not enough lines.")
end

while number_of_lines > 0
  puts "Launch School is the best!"
  number_of_lines -= 1
end
```

## Launch School Solution & Discussion
### Solution

```rb 
number_of_lines = nil
loop do
  puts '>> How many output lines do you want? Enter a number >= 3:'
  number_of_lines = gets.to_i
  break if number_of_lines >= 3
  puts ">> That's not enough lines."
end

while number_of_lines > 0
  puts 'Launch School is the best!'
  number_of_lines -= 1
end
```

### Discussion

Like the previous exercise, our solution uses the soon-to-be-familiar pattern of looping to obtain a valid input. In this case, we use `#to_i` to convert inputs to Integer values, and only allow inputs of at least 3.

Once we have the number of lines to print, it’s a simple matter to just print the lines in a loop.