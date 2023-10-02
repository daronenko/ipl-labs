# frozen_string_literal: true

require 'date'

def get_closest_date(dates, target_date)
  dates.min_by do |date|
    (Date.parse(date) - target_date).abs
  end
end
