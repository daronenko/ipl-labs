# frozen_string_literal: true

class AddIndexCalc < ActiveRecord::Migration[7.0]
  def change
    add_index :calcs, :input_sequence, unique: true
    # add_index :calcs, :input_sequence
  end
end
