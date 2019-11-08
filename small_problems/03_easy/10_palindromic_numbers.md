# Palindromic Numbers
Write a method that returns true if its integer argument is palindromic, false otherwise. A palindrome number reads the same forwards and backwards.

Examples: 

```rb 
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
```

### My Solution

```rb
def palindromic_number?(integers)
	integers.to_s == integers.to_s.reverse
end
```

## Launch School Solution & Discussion
### Solution

```rb
def palindrome(string)
  string == string.reverse
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end
```

### Discussion

The hardest part of this program is recognizing the easiest way to tell if a number is palindromic is to convert it to a string first, then check whether that string is palindromic. To determine if the string is palindromic, we use the `palindrome?` method we wrote earlier.


### Further Exploration

Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?

Let’s test it out. I’m going based off of the solution provided by Launch School in order to figure this out. Here are some example method invocations and the results I got from running these tests:

```rb
palindromic_number?(0) # true
palindromic_number?(00110) # false
palindromic_number?(000) # true
```

Since Ruby interprets numbers with leading 0s as octal values, a number like `00110` will not be a palindrome because it actually gets passed to the method as the decimal equivalent of 00110 in octal. If we test this out and put `00110` in the irb environment it will give us the returned value of `72`.

There is a way to convert an integer into a string with leading zeros using the `String#%` method. This allows you to convert the integer to a formatted string with leading zeros. So for instance, if you used `"%05d" % 110` as your argument, `00110` would technically be passed to the method as your argument.

```
irb(main):001:0> "%05d" % 110
=> "00110"
```

This way you could convert the number `110` to a string with 2 leading zeros before passing it to `palindromic_number?` method. That said, this would be the same as passing the string `”00100"` to the method, at which point your method is no longer receiving an integer as an argument.