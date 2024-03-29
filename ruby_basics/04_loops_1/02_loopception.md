# Loopception
The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so each loops stops after the first iteration.

```rb 
loop do 
	puts 'This is the outer loop.'
	
	loop do
	  puts 'This is the inner loop.'
	end
 end

puts 'This is outside all loops.'
```

## Launch School Solution & Discussion
### Solution

```rb
loop do 
	puts 'This is the outer loop.'

	loop do
	  puts 'This is the inner loop.'
	  break
	end

	break
 end

puts 'This is outside all loops.'
```

### Discussion

Looping within a loop is not uncommon. Therefore, it’s important to understand how to avoid infinite loops and where to place `break` statements. When it comes to nested loops, it can be difficult to clearly understand what’s going on. As you digest the code, focus on one loop at a time.

We begin by modifying the innermost block. This loop can be stopped by placing `break` on the line following `#puts`. This forces the loop to iterate only once. After we’ve fixed the innermost loop, our attention is now focused on the parent loop. We modify this loop the same way we modified the child loop: by placing `break` on the line following the `end` of the innermost loop.

- - - -

**NOTE**: The code in this exercise is a bad practice. We use it to illustrate how to break out of a nested loop, not to encourage the use of loops that only perform one iteration. We can easily rewrite this code without using any loops, but then the problem makes no sense:

```rb 
puts 'This is the outer loop.'
puts 'This is the inner loop.'
puts 'This is outside all loops.'
```