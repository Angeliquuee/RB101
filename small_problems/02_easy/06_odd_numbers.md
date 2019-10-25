# Odd Numbers
Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

### My Solution

```rb
puts (1..99).step(2).to_a
```

## Launch School Solution & Discussion 
### Solution

```rb 
value = 1
while value <= 99
	puts value
	value += 2
end
```

### Discussion
There are a variety of different ways to approach this problem, so don’t be worried if your solution is significantly different. 

Our solution simply takes a basic approach of counting up from 1 to 99 by 2s, and printing each value.

### Further Exploration

Repeat this exercise with a technique different from the one you just used, and different from the solution shown above. You may want to explore the use `Integer#upto` or `Array#select` methods, or maybe use `Integer#odd?`

### Integer#upto

```rb
1.upto(99) {|n| puts n if n.odd? }
```

### Array#select

```rb
puts (1..99).select(&:odd?)
```

### Integer#odd?

```rb
(1..99).each { |n| puts n if n.odd? }
```