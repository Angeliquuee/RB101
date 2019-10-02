# What’s my Bonus?
Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is `true`, the bonus should be half the salary. If the boolean is false, the bonus should be `0`

Examples:

```rb 
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50_000, true) == 25_000
```

The tests above should print `true`.

```rb 
def calculate_bonus(integer, boolean)
  if boolean
    integer / 2
  else
    return 0
  end
end

puts calculate_bonus(2800, true) # => 1400
puts calculate_bonus(1000, false) # => 0
puts calculate_bonus(50_000, true) # => 25_000
```

## Launch School Solution & Discussion

### Solution 

```rb 
def calculate_bonus(salary, bonus)
	bonus ? (salary / 2) : 0
end
```

### Discussion

The solution to this exercise takes advantage of the ternary operator. We’re able to use `bonus` as the condition because it’s a boolean, which means its value will only be `true` or `false`. If it’s `true`, then we divide `salary` by `2` and return the quotient. If it’s `false`, then we return `0`.