=begin
def string_length(sentence)
  strings = sentence.split

  strings.map { |chars| chars.length }
end

string_length('To be or not to be')
=end

=begin
def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
  end
end

string_lengths('to be or not to be')
=end

=begin
def string_lengths(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end

string_lengths("To be or not to be")
=end

def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 0

  until counter == (strings.size)  do
    word_length = strings[counter].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

string_lengths('To be or not to be')