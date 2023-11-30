# frozen_string_literal: true

class CalcController < ApplicationController
  def index; end

  def all
    respond_to do |format|
      format.xml { render xml: Calc.all.to_xml }
      format.html { @calcs = Calc.order(clicks: :desc) }
    end
  end

  def result
    raise ArgumentError if params[:value].empty?

    array = params[:value].split
    array.length.times do |i|
      value = Float(array[i])
      value = value.to_i if (value % 1).zero?
      array[i] = value
    end

    @calc = Calc.find_by(input_sequence: array.join(' '))
    @calc = Calc.save_sequence(array) if @calc.nil?
    redirect_to calc_show_url(id: @calc.id)
  rescue ArgumentError
    redirect_to root_path
  end

  def show
    id = Integer(params[:id])
    return unless id && Calc.find_by(id: id)

    @calc = Calc.find(id)
  end
end
