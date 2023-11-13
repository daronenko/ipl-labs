# frozen_string_literal: true

# Processing input data
class IndexController < ApplicationController
  def input; end

  def view
    _validate_input
    redirect_to root_path(error: @error, number: @number, array: @array.join(' ')) unless @error.nil?
    raise ArgumentError if @array.nil?

    # processing of array is here...

    @output = @array.join(' ')
  rescue ArgumentError
    @error = 'Что-то пошло не так...'
  end

  protected

  def _validate_array
    raise ArgumentError if params[:array].empty?

    @array = params[:array].split
    @array.length.times do |i|
      value = Float(@array[i])
      value = value.to_i if (value % 1).zero?
      @array[i] = value
    end
    @error = nil
  rescue ArgumentError
    @error = 'Массив должен состоять из чисел, разделенных пробелами!'
  end

  def _validate_number
    raise ArgumentError if params[:number].empty?

    @number = params[:number].to_i
    raise ArgumentError if @number > @array.length
  rescue ArgumentError
    @error = 'Число должно быть больше 0 и не превышать длину массива!'
  end

  def _validate_input
    @error = nil
    _validate_array unless params[:number].nil?
    _validate_number unless params[:array].nil?
  end
end
