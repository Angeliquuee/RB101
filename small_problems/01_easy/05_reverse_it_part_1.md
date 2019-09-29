# Reverse It (Part 1)
Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Examples:

```rb
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
```

The tests above should print ‘true’

```rb
sentence = "This is a sentence"
another_sentence = "Hello my name is Angelica"
hello_world = "Hello World"


def reverse_sentence(string)
  # Converting the sentence into an array
  array_conversion = string.split(" ").map(&:to_s)
  # Reversing that array
  reversed_array = array_conversion.reverse
  # Final reversed sentence
  reversed_sentence = reversed_array.join(' ').capitalize << "."
  print reversed_sentence
end

puts reverse_sentence(sentence) # Sentence a is this.
puts reverse_sentence(another_sentence) # Angelica is name my hello.
puts reverse_sentence(hello_world) # World hello.
```

## Launch School Solution & Discussion
### Solution

```rb 
def reverse_sentence(string)
	string.split.reverse.join(' ')
end
```

### Discussion

To reverse the order of substrings within a string, we first need to separate those substrings. In our solution, we use `#split` with no arguments to separate each word and place it in an array. To reverse the order of the words, we then invoke `#reverse` on the array. Now, `string` looks like this:

```rb
'Hello World'.split.reverse # => ["World", "Hello"]
```

That’s precisely what we want except we need it to be a string, not an array. To accomplish this, we invoke `#join` which joins every element in an array using the given argument as the delimiter.