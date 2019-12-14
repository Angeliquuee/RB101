# Repeat after me
Write a program that asks the user to type something in, after which your program should simply display what was entered

```
>> Type anything you want:
This is what I typed.
This is what I typed.
```

### My Solution

```rb 
def prompt(message)
  puts ">> #{message}"
end

prompt("Type anything you want:")
user_input = gets.chomp
puts user_input
```

## Launch School Solution & Discussion
### Solution

```rb 
puts ">> Type anything you want:"
text = gets 
puts text
```

### Discussion

This program first uses `#puts` to display a prompt. The use of `>>` is nothing special - we just use is it to distinguish prompts from other kinds of text displayed by the program. It doesn’t matter if you leave it off.

After displaying the prompt, we get `#gets` to read a line of input from the user and store it to a variable named `text`.

Finally, we use `#puts` a second time to redisplay what the user typed.