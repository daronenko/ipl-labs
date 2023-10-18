class CalcController < ApplicationController
  def input
    render layout: false
  end
  
  def view
    input = params[:array]
    @longest_sequence = []
    @sequences = []

    return unless input&.match?(/\A\s*\d+(\s+\d+)*\s*\z/)

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

    @result = {
      longest_sequence: @longest_sequence,
      sequences: @sequences
    }
    respond_to do |format|
      format.html
      format.json do
        render json: {
          type: @result.class.to_s,
          value: @result
        }
      end
    end
  end
end
