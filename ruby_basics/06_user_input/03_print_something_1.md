# Print Something (Part 1)
Write a program that asks the user whether they want the program to print “something”, then print it if the user enters `y`. Otherwise, print nothing.

Examples:

```
>> Do you want me to print something? (y/n)
y
something

>> Do you want me to print something? (y/n)
n

>> Do you want me to print something? (y/n)
help
```

### My Solution

```rb 
def prompt(message)
  puts ">> #{message}"
end

prompt("Do you want me to print something? (y/n)")
answer = gets.chomp.downcase

if (answer == 'y')
  puts "something"
elsif (answer == 'n')
  puts ""
else
  puts "Please choose either y or n"
end
```

## Launch School Solution & Discussion
### Solution

```rb 
puts '>> Do you want me to print something? (y/n)'
choice = gets.chomp
puts 'something' if choice == 'y'
```

### Discussion

Here we display an appropriate prompt using `#puts`, obtain the user’s input with `#gets`, and finally, print `something` with `#puts` if the user entered a `y`.

Note that we now need to use `#chomp` on the return value of `#gets`; if we don’t the newline character will be included in `choice`, and `choice == 'y'` will return `false`.