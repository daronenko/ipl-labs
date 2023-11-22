# frozen_string_literal: true

# Processing input array
class IndexController < ApplicationController
  def input; end

  def view
    validate_input_
    return unless @error.nil?

    avg = positive_avg_(@array)
    pos = (@array.length - 1) / 2
    @array[pos] = to_numeric_(avg.round(2))

    @output = @array.join(' ')
  rescue StandardError
    @error = 'Что-то пошло не так...'
  end

  private

  def validate_array_
    raise ArgumentError if params[:array].empty?

    pattern = /\s*[+-]?\d+(\.?\d+)?\s*/

    @array = params[:array].split
    @array.length.times do |i|
      raise ArgumentError unless @array[i].match(pattern)

      @array[i] = to_numeric_(@array[i])
    end
    @error = nil
  rescue ArgumentError
    @error = 'Массив должен состоять из целых или вещественных чисел, разделенных пробелами!'
  end

  def validate_input_
    @error = nil
    validate_array_ unless params[:array].nil?
    return if @error.nil?

    array_string = @array.nil? ? '' : @array.join(' ')
    redirect_to root_path(error: @error, array: array_string) unless @error.nil?
  end

  def positive_avg_(array)
    positive_total = 0
    positive_count = 0
    array.each do |number|
      if number.positive?
        positive_total += number
        positive_count += 1
      end
    end

    positive_total.to_f / positive_count
  end

  def to_numeric_(number)
    value = Float(number)
    value = value.to_i if (value % 1).zero?
    value
  end
end
