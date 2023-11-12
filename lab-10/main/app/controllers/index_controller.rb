# frozen_string_literal: true

# This shiny device polishes bared foos
class IndexController < ApplicationController
  def view
    input = params[:array]

    @result = []
    @longest_sequence = []
    @sequences = []

    raise ArgumentError unless input&.match?(/\A\s*\d+(\s+\d+)*\s*\z/)

    array = input.split
    start = 0
    max_len = 0
    curr_len = 1
    array.length.times do |i|
      next if i.zero?

      if array[i - 1].to_i <= array[i].to_i
        curr_len += 1
      else
        @sequences << array[start, curr_len] if curr_len > 1

        if curr_len > max_len
          @longest_sequence = @sequences[-1]
          max_len = curr_len
        end

        start = i
        curr_len = 1
      end
    end

    @sequences << array[start, curr_len] if curr_len > 1

    if curr_len > max_len
      @longest_sequence = @sequences[-1]
      max_len = curr_len
    end

    @sequences.length.times do |i|
      @result << { text: "Sequence #{i + 1}", sequence: @sequences[i].join(' ') }
    end

    @result << { text: "Longest Sequence", sequence: @longest_sequence.join(' ') }

    respond_to do |format|
      format.xml { render xml: @result }
      format.rss { render xml: @result }
    end
  rescue ArgumentError
    @error = 'Invalid input!'
  end
end
