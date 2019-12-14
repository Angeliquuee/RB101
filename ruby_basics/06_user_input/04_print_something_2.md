# Print Something (Part 2)
In the previous exercise, you wrote a program that asks the user if they want the program to print “something”. However, this program recognized any input as valid: if you answered anything but `y`, it treated it as an `n` response, and write without printing anything.

Modify your program so it prints an error message for any inputs that aren’t `y` or `n`, and then asks you to try again. Keep asking for a response until you receive a valid `y` or `n` case sensitive input is generally a poor user interface choice. Whenever possible, accept both uppercase and lowercase inputs.

```
>> Do you want me to print something? (y/n)
y
something

>> Do you want me to print something? (y/n)
help
>> Invalid input! Please enter y or n
>> Do you want me to print something? (y/n)
Y
something

>> Do you want me to print something? (y/n)
N

>> Do you want me to print something? (y/n)
NO
>> Invalid input! Please enter y or n
>> Do you want me to print something? (y/n)
n
```

### My Solution

```rb 
def prompt(message)
  puts ">> #{message}"
end

answer = nil

loop do
  prompt("Do you want me to print something? (y/n)")
  answer = gets.chomp.downcase

  if (answer == 'y')
    puts "something"
    break
  elsif (answer == 'n')
    puts ""
    break
  else
    prompt("Please enter either y or n.")
  end
end
```

## Launch School Solution & Discussion
### Solution

```rb 
choice = nil
loop do 
  puts ">> Do you want me to print something? (y/n)"
  choice = gets.chomp.downcase
  break if %w(y n).include?(choice)
  puts ">> Invalid input! Please enter y or n"
end 
puts 'something' if choice == 'y'
```

### Discussion

This solution to this exercise will become a familiar pattern early during your Launch School learning. We use a plain `loop` to solicit inputs until we have a valid input, then exit that loop.

In most such loops, we will need the user’s choice after the loop finishes running. Since variables created inside of loops are scooped in such a way that they aren’t visible outside the loop, we must start by first defining the variable we want to use. Here we start by setting `choice` to nil; this guarantees that `choice` will be available inside the loop after the loop has finished running.

Inside the loop, we display our prompts, and then use `#gets` to read the user’s input. We also use `#chomp` in this case to get rid of the newline, and `#downcase` to convert the input to lowercase.

Next, we use `#break` to exit the loop if the user’s input is a valid choice. Here we use `#include?` and apply it against an `Array` that contains the list of valid entries (`y` and `n`). We use the `#%w()` shortcut syntax to represent the `Array` since it is easier to read `%w(y n)` than `[‘y’, 'n']`

If we have an invalid response, we display an error message, after which the loop repeat. It continues repeating until a valid choice is entered.

After the loop finishes, we perform the requested action: we print “something”, but only if the user’s choice was `y`.