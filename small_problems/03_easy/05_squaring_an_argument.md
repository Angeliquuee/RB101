# Squaring an Argument
Using the `multiply` method from `Multiplying Two Numbers` problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

Example: 

```rb 
square(5) == 25
square(-8) == 64
```

### My Solution

```rb 
def multiply(n1, n2)
	n1 * n2
end 

def square(n1)
	multiply(n1, n1)
end
```

## Launch School Solution & Discussion

### Solution
```rb 
def square(n)
  multiply(n, n)
end
```

### Discussion 

Our implementation relies on the previous exercise’s `multiply` method. The return value of `multiply` is the result of multiplying the two arguments we pass to it, so we can simply pass in the same number twice, which will return the square value. Our `square` method is implicitly returning the return value from `multiply(n, n)`

### Further Exploration

What if we wanted to generalize this method to a “power to the n” type method: cubed, to the 4th power, to the 5th, etc. how would we go about doing so while still using the `multiply` method?

```rb 
def power(num, n)
	if n == 0
		1
	elsif n > 0
		multiply(power(num, n - 1), num)
	else
		1 / power(num, - n).to_f
	end
end

p power(3, 3)
```