def prompt(message)
  Kernel.puts("=> #{message}")
end

intro = <<-MSG
Welcome to the Mortgage Calculator!
----------------------------------
MSG

prompt(intro)
prompt("Please enter your name: ")
name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    "Please enter a valid name!"
  else
    break
  end
end

prompt("Hello #{name}, let\'s figure out your financial situation!")

loop do
  amount = ''
  loop do
    prompt("What is the loan amount?")
    amount = Kernel.gets().chomp()

    if amount.empty?() || amount.to_f() < 0
      prompt("Please enter a positive and valid number.")
    else
      break
    end
  end

  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()

    if interest_rate.empty?() || interest_rate.to_f() < 0
      prompt("Please enter a positive and valid number.")
    else
      break
    end
  end

  prompt("What is the loan duration (in years)?")

  years = ''
  loop do
    years = Kernel.gets().chomp()

    if years.empty?() || years.to_i() < 0
      prompt("Please enter a valid number!")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12

  monthly_payment = amount.to_f() * (monthly_interest_rate / (1- (1 + monthly_interest_rate)**(-months)))
  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt("Do you want to perform another calculation? (Y to calculate again.)")
  reply = Kernel.gets().chomp()

  break unless reply.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage calculator!")
