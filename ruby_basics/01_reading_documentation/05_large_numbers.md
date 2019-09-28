# Large Numbers
Using the ruby documentation, determine how you can write large numbers in a way that makes them easier to read.

If we look at the topic of Literals in the Ruby documentation, it gives us an example for enhancing the readability for humans with integers using underscores. You can also use special prefixes to write numbers in decimal, hexadecimal, octal, or binary formats. 

You can write integers of any size as follows: 

```
1234
1_234
```

Floating point numbers may be written as follows;

```
12.34
1234e-2
1.234E1
```

All of these numbers have the same value. Here is an example of using a special prefix to write numbers in those special formats I mentioned earlier.

For decimals use a prefix of `0d`, for hexadecimal numbers use a prefix of `0x`, for octal numbers use a prefix of `0` or `0o`, for binary numbers use `0b`. The alphabetic component of the number is not case-sensitive.

```
0d170
0D170

0xaa
0xAa
0xAA
0Xaa
0XAa
0XaA

0252
0o252
0O252

0b10101010
0B10101010
```

All of those values have the same decimal value, 170. Like integers and floats you may use an underscore for readability.
- - - -

## Launch School Solution & Discussion 

### Approach/Algorithm

You will find this information under the topic of **literals**.

### Solution

You can write large numbers by using underscores to separate groups of digits, like so:

```
1_987_654_321
```

### Discussion

Finding this information can be a bit difficult, especially if you don’t know the right terms; most values you use in ruby have some sort of “literal” syntax: numbers can be entered as `123`, while Strings are entered using quotes, e.g., `”quotes”`. They key word here is **literal**. Since it is also a syntax item, we might start our search on the syntax page in the core API documentation.

- - - -

### Further Exploration

Is it over to write the above number as `19_87_65_4321`?

If we’re speaking in terms of achieving the same value, then sure, it is definitely okay. But I believe that professional Rubyists might stick with `1_987_654_321` instead since it is much easier to read than `19_87_65_4321` and looks cleaner and more organized. That is just my opinion though.. I’m not sure if Rubyists actually do this, but I assume they do.