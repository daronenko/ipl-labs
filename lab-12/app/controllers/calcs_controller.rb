# frozen_string_literal: true

class CalcsController < ApplicationController
  before_action :set_calc, only: %i[show edit update destroy]

  # GET /calcs or /calcs.json
  def index
    @calcs = Calc.all
  end

  # GET /calcs/1 or /calcs/1.json
  def show; end

  # GET /calcs/new
  def new
    @calc = Calc.new
  end

  # GET /calcs/1/edit
  def edit; end

  # POST /calcs or /calcs.json
  def create
    array = params[:value].split
    array.length.times do |i|
      value = Float(array[i])
      value = value.to_i if (value % 1).zero?
      array[i] = value
    end

    @calc = Calc.save_sequence(array, current_user.id)
    @calc = Calc.find_by(input_sequence: array.join(' '))
    @calc = Calc.save_sequence(array) if @calc.nil?
    redirect_to calc_url(@calc)
  rescue
    redirect_to new_calc_path
  end

  # PATCH/PUT /calcs/1 or /calcs/1.json
  def update
    respond_to do |format|
      if @calc.update(calc_params)
        format.html { redirect_to calc_url(@calc), notice: 'Calc was successfully updated.' }
        format.json { render :show, status: :ok, location: @calc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calcs/1 or /calcs/1.json
  def destroy
    @calc.destroy

    respond_to do |format|
      format.html { redirect_to calcs_url, notice: 'Calc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calc
    @calc = Calc.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def calc_params
    params.require(:calc).permit(:input_sequence)
  end
end
