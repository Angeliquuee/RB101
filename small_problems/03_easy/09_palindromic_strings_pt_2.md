# Palindromic Strings (Part 2)
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the `palindrome?` method you wrote in the previous exercise.

Examples: 

```rb 
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
```


## Launch School Solution & Discussion
### Solution

```rb
def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end
```

### Discussion

Chances are you reached for a `String#gsub` here to eliminate the non-alphanumeric characters. There’s nothing wrong with that, but we
Ll take the opportunity to use and talk about `String#delete` instead. `#delete` is an interesting method that takes arguments that sort of look like regular expressions, and then deletes everything formed by the intersection of all of its arguments. See the documentation for complete details.

For our purposes, we need to remove the non-alphanumeric characters; to do that, we tell `delete` to delete everything that isn’t a letter or digit. We then pass the result to our original `palindrome?` method to determine if the cleaned up string is a palindrome.


### Further Exploration

Read the documentation for `String#delete`, and the closely related `String#count` (you need to read `count` to get all of the information you need for `delete`.)

**What The Documentation Says For String#count**

`String#count` is a String class method in Ruby. In this method each parameter defines a set of characters to which is to be counted. The intersection of these sets defined the characters to count in the given string. Any other string which starts with a caret ^ is negated.

**Syntax**: `str.count(parameter_list)`
**Parameters**: Here, str is the given string.
**Returns**: The number of the characters

Example 1: 

```rb
# Ruby program to demonstrate the count method
# Taking a string and using the method

str = "String Counting"
puts str.count("ing")

# Output:
# 7
```

Example 2:

```rb 
# Ruby program to demonstrate the count method
# Taking a string and using the method

str = "String Counting"
puts str.count("^ing")

str2 = "Ruby Method\\r\\n\"
puts str.count("\\")

# Output:
# 8
# 0
```

**What The Documentation Says For String#delete**

`String#delete` is a String class method in Ruby which is used to return a copy of the given string with all characters in the section of its arguments delete.

**Syntax**: `str.delete(paramater_list)`
**Parameters**: Here, `str` is the given string and `paramater_list` are the specified characters.
**Returns**: A new copy of the string with all characters in the intersection of its arguments deleted.

Example 1:

```rb
# Ruby program to demonstrate the delete method
# Taking a string and using the method

str = "String Counting"
puts str.delete("ing")

# Output:
# Str Cout
```

Example 2:

```rb 
# Ruby program to demonstrate the delete method
# Taking a string and using the method

str = "String Counting"
puts str.delete("ing", "^n")

str2 = "Ruby Method\\r\\n"
puts str2.delete("\\")

# Output:
# Strn Countn
# Ruby Methodrn
```

The `String#delete` method has the same rules for building the set of characters as `String#count`