# frozen_string_literal: true

def alnum?(str)
  /^[[:alnum:]]+$/.match?(str)
end

def numeric?(str)
  /^[[:digit:]]+$/.match?(str)
end

def fix_text(strings)
  corrections = 0
  strings.size.times do |i|
    new_string = []
    strings[i].size.times do |j|
      if alnum? strings[i][j]
        if numeric? strings[i][j][0]
          new_string.push("_#{strings[i][j][1..]}")
          corrections += 1
        else
          new_string.push(strings[i][j])
        end
      else
        corrections += 1
      end
    end
    strings[i] = new_string
  end
  corrections
end

def input(count)
  raise StandardError, "'count' cannot be a negative number!" if count.negative?

  strings = []
  count.times do |i|
    print "#{i + 1} "
    strings.push(gets.split)
  end

  strings
end

def show(strings)
  strings.size.times do |i|
    puts "#{i + 1} #{strings[i].join(' ')}"
  end
end
