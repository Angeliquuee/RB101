# Tips & Gotchas (calculator.rb)
Even in this simple 20-line program, there are several interesting gotchas.

1. In a conditional, take care to make sure you’re doing an equality comparison (==), as opposed to an assignment (-)

```rb 
if operator == '1' # ok
. . .
if operator = '1' # will always return true
```

2. Pay attention to what object you’re comparing against. It makes a huge difference.

```rb 
if operator == 1 
# vs
if operator == '1'
```

As mentioned in the notes, if we use an integer it will always return false. That is why we catch the operator with a string.

3. Understand the concept of “integer division”.. like using floats to get more precise with integer division.

4. The `String#to_i` and `String#to_f` methods are very handy, but understand their limitations (Hint: read the documentation.)

5. Local variables initialized within an `if` can be accessed outside of the `if`.

6. In Ruby, `if` expressions can return a value.

```rb
answer = if true
				'yes'
			else
				'no'
			end

Kernel.puts(answer) # => yes
```