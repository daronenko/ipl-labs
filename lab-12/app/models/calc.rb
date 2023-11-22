# frozen_string_literal: true

class Calc < ApplicationRecord
  belongs_to :user

  validates :input_sequence, presence: true, uniqueness: true
  validates :output_sequences, presence: true

  class << self
    def save_sequence(array, user_id)
      sequences = []
      longest_sequence = []

      start = 0
      max_len = 0
      curr_len = 1
      array.length.times do |i|
        next if i.zero?

        if array[i - 1].to_i <= array[i].to_i
          curr_len += 1
        else
          sequences << array[start, curr_len] if curr_len > 1

          if curr_len > max_len
            longest_sequence = sequences[-1]
            max_len = curr_len
          end

          start = i
          curr_len = 1
        end
      end

      sequences << array[start, curr_len] if curr_len > 1

      if curr_len > max_len
        longest_sequence = sequences[-1]
        max_len = curr_len
      end

      sequences << longest_sequence

      sequences.length.times do |i|
        sequences[i] = sequences[i].join(' ')
      end

      create input_sequence: array.join(' '), output_sequences: sequences.join('\n'), user_id: user_id
    end
  end
end
