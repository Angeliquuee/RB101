# Runaway Loops
The code below is an example of an infinite loop. The name describes exactly what it does: loop infinitely. This loop isn’t useful in a real program though. Modify the code so the loop stops after the first iteration.

```rb 
loop do 
	puts 'Just keep printing..'
end
```

## Launch School Solution & Discussion
### Solution

```rb
loop do 
	puts 'Just keep printing..'
	break
end
```

### Discussion

Stopping a loop is as simple as adding the reserved work `break` inside the loop. `break` is nearly always necessary when using `loop` and doesn’t require any conditions. When `loop` executes a `break`, it stops iterating immediately and exits the block.