# frozen_string_literal: true

class AddIndexUser < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :username, unique: true
    # add_index :users, :username
  end
end
