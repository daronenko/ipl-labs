# frozen_string_literal: true

class CreateCalcs < ActiveRecord::Migration[7.0]
  def change
    create_table :calcs do |t|
      t.string :input_sequence, null: false
      t.string :output_sequences, null: false

      t.timestamps
    end
  end
end
