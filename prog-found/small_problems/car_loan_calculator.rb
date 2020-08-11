
def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt("Welcome to Car-Loan-Calculator")
  prompt("------------------------------")
  prompt("")
  prompt("Please enter your Loan Amount:")
  prompt("(Example: 10000 for $10,000.)")
  prompt("Use no special characters.")

  loan = ''
  loop do
    loan = gets.chomp

    if loan.empty? || loan.to_f < 0
      prompt("You must enter a positive number.")
    else
      break
    end
  end

  prompt "Now, please enter your Interest Rate:"
  prompt "(Example: 5 for 5%, or 2.5 for 2.5%)"
  prompt "(Use no specical characters.)"

  interest_rate = ''

  loop do
    interest_rate = gets.chomp

    if interest_rate.empty? || interest_rate.to_f < 0
      prompt "You must enter a positive number."
    else
      break
    end
  end

  prompt "Finally, please enter your loan duration in years:"
  prompt "(Example: 10)"
  prompt "(Use no special characters.)"

  loan_duration = ''

  loop do
    loan_duration = gets.chomp

    if loan_duration.empty? || loan_duration.to_f < 0
      prompt("You must enter a valid number.")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = loan_duration.to_i * 12

  prompt loan
  prompt interest_rate
  prompt loan_duration
  prompt "------------"
  prompt ""
  prompt annual_interest_rate
  prompt monthly_interest_rate
  prompt months

  prompt monthly_payment = loan.to_f * (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-months)))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt("Another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
