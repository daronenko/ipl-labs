# frozen_string_literal: true

def count_words(target_len, source)
  count = 0

  File.open(source, 'r') do |file|
    file.each do |line|
      words = line.split(' ')
      words.each do |word|
        count += 1 if word.length == target_len
      end
    end
  end

  count
end

def generate_words(path)
  words = []
  letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

  rand(1000).times do
    word = ''
    rand(20).times do
      word += letters[rand(letters.length)]
    end
    words << word
  end

  File.open(path, 'w') do |file|
    file.write(words.join(' '))
  end
end
