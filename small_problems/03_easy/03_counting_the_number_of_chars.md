# Counting the Number of Characters
Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

Input:

```
Please write word or multiple words: walk
```

Output:

```
There are 4 characters in "walk".
```

Input: 

```
Please write word or multiple words: walk, don't run
```

Output:

```
There are 13 characters in "walk, don't run"
```

### My Solution

```rb 
def prompt(message)
	puts "==> #{message}"
end

def character_count(word)
	final_word = word.split.join
	final_word.length
end

prompt("Please write word or multiple words:")
user_input = gets.chomp.to_s

char_number = character_count(user_input)

prompt("There are #{char_number} characters in the string '#{user_input}'.")
```

## Launch School Solution & Discussion

### Solution

```rb 
print 'Please write word or multiple words: '
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."
```

### Discussion

We don’t want to count spaces here, so we use `String#delete` to return a new `String` with all spaces removed from it. The original string stored in `input` is left intact.