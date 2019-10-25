# Even Numbers
Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

### My Solution

```rb
(1..99).each { |n| puts n if n.even? }
```

## Launch School Solution & Discussion 
### Solution

```rb 
value = 1
while value <= 99
	puts value if value.even?
	value += 1
end
```

### Discussion
Our solution is just a minor variation on the solution to print odd numbers. This time, though, we increment the value by 1 with every iteration, and only print if it is even.