# Optional Arguments
Assume you have the following code:

```rb
s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect
puts s.split(',').inspect
puts s.split(',', 2).inspect
```

```rb
puts s.split.inspect
# ["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"] => nil

puts s.split(',').inspect
# ["abc def ghi", "jkl mno pqr", "stu vwx yz"] => nil

puts s.split(',', 2).inspect
# ["abc def ghi", "jkl mno pqr,stu vwx yz"] => nil
```

- - - -

## Launch School Solution & Discussion
### Solution

```
# puts s.split.inspect
[“abc”, “def”, “ghi,jkl”, “mno”, “pqr,stu”, “vwx”, “yz”]

# puts s.split(‘,’).inspect
[“abc def ghi”, “jkl mno pqr”, “stu vwx yz”]

# puts s.split(‘,’, 2).inspect
[“abc def ghi”, “jkl mno pqr,stu vwx yz”]
```

### Discussion

The documentation for `String#split` shows that its signature is: 

* split(pattern=nil, [limit]) → anArray

This signature shows two different ways that the ruby documentation shows optional arguments; the first form (`pattern=nil`) is used when an optional argument has a default value, while the `[]` in the `[limit]` tells us that this is an optional argument with no default value. You will sometimes see square brackets around optional arguments that have default values; we’ll see this in another exercise later on.

From this, we can tell that calling `#split` without arguments is equivalent to calling it with one argument, `s.split(nil)`, which causes `#split` (per the text below the signature) to use a strange global variable named `$;`. We won’t discuss this variable right now, but it will almost always be `nil`; this is the default. When `$;` is `nil`, `#split` splits the String based on white space. So, our first call to `#split` returns an Array of 7 elements after splitting `s` at each sequence of spaces.

The documentation also tells us that we can supply an explicit value on which to split the String by passing that value as the first argument. This value can be `String` or a `Regexp`; we opt to pass in a String `’,’` which causes `s` to be split on commas. We thus get an Array of 3 Strings in the second `puts`.

Finally, the documentation tells us that we can specify a limit as the 2nd argument; the limit restricts the split operation so that no more than `limit` values are returned; any other delimiters will be ignored. So, our 3rd call returns a 2 element Array.

We can tell that `#split` returns `Array`s by looking at the signature; it shows that the return value is `anArray`, which is just another way to say that an `Array` is created and return by the method.

It’s difficult tot tell from the text, but the fact that `#split` returns the results of a split operation as an `Array` suggests that it does not alter the original `String`. This is, in fact, the case; `#split` does not mutate the `String` to which it is applied. This can be tested in irb if you are uncertain: 

```rb
>> s = 'abc def ghi,jkl mno pqr,stu vwx yz'
=> "abc def ghi,jkl mno pqr,stu vwx yz"
>> puts s.split.inspect
["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]
=> nil
>> puts s
"abc def ghi,jkl mno pqr,stu vwx yz"
=> nil
```