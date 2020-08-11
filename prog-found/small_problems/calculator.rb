# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation
# output the result

require "yaml"
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when "1"
    'Adding'
  when "2"
    'Subtracting'
  when "3"
    'Multiplying'
  when "4"
    'Dividing'
  end
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt("Hi, #{name}.")

loop do # main loop
  num1 = ''
  loop do
    prompt "Please enter the first number:"
    num1 = gets.chomp.to_i

    if valid_number?(num1)
      break
    else
      prompt "Hmmm... Fuck off, and try again...  (Not a valid number.)"
    end
  end

  num2 = ''
  loop do
    prompt "Please enter the second number:"
    num2 = gets.chomp.to_i

    if valid_number?(num2)
      break
    else
      prompt "Fuck off...  Wanker...  (Not a valid number.)"
    end
  end

  prompt "What operation would you like to perform?"
  puts "1) Add"
  puts "2) Subtract"
  puts "3) Multiply"
  puts "4) Divide"

  operation = ''
  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt("Must use 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

=begin
  if operation == '1'
    result = num_1 + num_2
  elsif operation == '2'
    result = num_1 + num_2
  elsif operation == '3'
    result = num_1 * num_2
  elsif operation == '4'
    result = num_1.to_f / num_2.to_f
  end
=end

  result = case operation
           when '1'
             num1 + num2
           when '2'
             num1 - num2
           when '3'
             num1 * num2
           when '4'
             num1.to_f / num2.to_f
           end

  prompt "The result is: #{result}"

  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Fuck off; Loser...."
