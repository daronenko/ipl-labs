# frozen_string_literal: true

class User < ApplicationRecord
  has_many :calcs

  has_secure_password
end
