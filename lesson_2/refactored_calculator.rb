def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0 # valid numerical representation
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name: ")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What is the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmm.. that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmm.. that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")

=begin
THINGS TO THINK ABOUT:

1. Is there a better way to validate that the user has input a number?

   Yes, it's called Regex (Regular Expression).

2. It looks like you can call `to_i` or `to_f` to convert strings to
   integers and floats, respectively. Look up the `String#to_i` and
   `String#to_f` documentation in Ruby docs and look at their various
   examples and use cases.

3. Our `operation_to_message` method is a little dangerous, because we're
   relying on the `case` statement being the last expression in the method.
   What if we needed to add some code after the `case` statement within the
   method? What changes would be needed to keep the method working with the
   rest of the program? We'll show a solution in an upcoming assignment..

4. Most Rubyists don't invoke methods with parantheses, unless they're
   passing in an argument. For example, we use `name.empty?()`, but mosts
   Rubyists would write `name.empty?`. Some Rubyists even go as far as not
   putting parantheses around method calls even when passing in arguments.
   For example, they would write `prompt "hi there"` as opposed to
  `prompt("hi there")`.

   Try removing some of the optional parantheses when calling methods to get
   your eyes acquainted with reading different styles of Ruby code. This will
   be especially useful if you are using a DSL written in Ruby, like Rspec or
   Rails.

5. We're using `Kernel.puts()` and `Kernel.gets()`. But the `Kernel.` is
   extraneous as well as the parantheses. Therefore, we can just call those
   methods by `gets` and `puts`. We already know that in Ruby we can omit
   the parantheses, but how come we can also omit the `Kernel.`?

   That is because... when we write Ruby code that's not in a class, we are
   working with an object called `main`, which is an instance of `Object`.
   The `Kernel` module is automatically loaded by `Object`, giving us access
   to all of its methods

   irb 001> self
   => main
   irb 002> self.class
   => Object

   Note: `Kernel` methods are available everywhere in Ruby

6. There are lots of messages sprinkled throughout the program. Could we
   move them into some configuration file and access by key? This would allow
   us to manage the messages much easier, and we could even internationalize
   the messages. This is just a thought experiment, and no need to code this
   up...

Hopefully these bullet points will help ME consider how many little edge
cases and features one simple program can have.
=end
