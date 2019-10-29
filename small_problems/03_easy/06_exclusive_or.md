# Exclusive Or
The `||` operator returns a truth value if either or both of its operands are truth, a falser value if both operands are falser. The `&&` operator returns a truth value if both of its operands are truth, and a false value if either operand is falser. This works great until you need one of the two conditions to be truth, the so-called *exclusive or*.

In this exercise, you will write a method named `xor` that takes two arguments, and returns `true` if exactly one of its arguments is truthy, `false` otherwise.

Examples:

```rb 
xor?(5.even?, 4.even?) == true 
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
```

### My Solution

```rb 
def xor?(n1, n2)
  if (n1 && !n2) || (n2 && !n1)
   true
  else 
   false
  end
end
```

## Launch School Solution & Discussion

### Solution

```rb
def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end
```

### Discussion
This implementation is straight forward; it simply returns `true` if exactly one of the values is truth; otherwise, it returns `false`. The explicit `false` return isn’t actually necessary since `return true if value2 && !value1` returns `nil` if the condition is false. However, methods whose name ends in a `?` should usually only return the explicit `true` and `false` values.

A shorter version of this method is:

```rb
def xor?(value1, value2)
  (value1 && !value2) || (value2 && !value1)
end 
```

This is more idiomatic ruby than the first solution, but it does take a little more effort to figure out what is going on.

Some of you may be tempted to use the `^` operator for this exercise. The `^` operator is a ruby bit-wise operator for performing exclusive-or bit operations. In some cases, this means that `^` can be used as an exclusive-or operator. However, this only works properly when both operands are the same type. For this reason, you should not use `^` as a boolean xor operator.

### Further Exploration

Can you think of a situation in which a boolean `xor` method would be useful? Suppose you were modeling a light at the top of a flight of stairs wired in such a way that the light can be turned on or off using either the switch at the bottom of the stairs or the switch at the top of the stairs. This is an xor configuration, and it can be modeled in ruby using the `xor` method. Think of some additional examples.

`||` and `&&` are so-called *short-circuit* operators in that the second operands is not evaluated if its value is not needed. Does the `xor` method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in `xor` operations even make sense?

Short-circuiting cannot be sensibly applied to XOR: whatever the value of the first operand, the second still needs to be examined. As mentioned before, it is really tempting to use the `^` operator, but will choke on truthy values like strings. 
