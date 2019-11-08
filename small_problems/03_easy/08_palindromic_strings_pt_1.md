# Palindromic Strings (Part 1)
Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

Examples:

```
palindrome?('madam') == true
palindrome?('Madam') == false # (case matters)
palindrome("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
```

### My Solution

```rb 
def palindrome?(word)
	if word == word.reverse
		return true
	else
		return false
	end
end
```

## Launch School Solution & Discussion
### Solution

```rb
def palindrome?(string)
  string == string.reverse
end
```

### Further Exploration

Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can either take an array or a string argument, and determines whether the argument is a palindrome. You may not use an `if`, `unless`, or `case` statement or modifier. 

**Method that checks to see if an array is palindromic**

```
def palindrome?(array)
	array == array.reverse
end
```