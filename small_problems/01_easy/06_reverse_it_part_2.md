# Reverse It (Part 2)
Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Examples:

```rb
puts reverse_words('Professional') # => lanoisseforP
puts reverse_words('Walk around the block')  # => Walk dnuora the kcolb
puts reverse_words('Launch School') # => hcnuaL loohcS
```

```rb 

word = "Professional"
word_2 = "Walk around the block"
word_3 = "Launch School"

def reverse_words(string)
  # Convert the string into an array
  array = string.split(' ')
  # Iterating through the array and reversing it if the
  # length is more than 5 characters
  array.each { |x| x.reverse! if x.length >= 5 }
  # Turning that array into a string
  puts array.join(' ')
end

reverse_words(word) # => lanoisseforP
reverse_words(word_2) # => Walk dnuora the kcolb
reverse_words(word_3) # => hcnuaL loohcS
```

## Launch School Solution & Discussion 
### Solution

```rb
def reverse_words(string)
	words = []

	string.split.each do |word|
	 word.reverse! if word.size >= 5
   words << word
  end 

  words.join(' ')
end
```

### Discussion

When given a string or an array, and asked to evaluate each character or element, your first instinct should be reach for an iterator. Our goal here is to iterate over the given string and check each word for the number of characters it contains. It has five or more character then we’ll reverse the word. 

At the top of our method, we create an empty array named `words` that will hold each modified word of the result: these words will be reversed if long, or as-is if they are short. We use `#each` to iterate over `string`, but first, we need to separate each word in `string` using `#split`, which returns an array contains the separated words. For each word, we count the number of characters it contains using `#size`. If it contains five or more characters, we use destructive method `#reverse!` to reverse the word. We mutate `word` so that we can add it to `words` by invoke `words << word`.

After iterating over `string` and evaluating each word, `words` will contain all of the words, with longer words reversed. Finally, we can invoke `words.join(‘ ‘)` to return the desired string.