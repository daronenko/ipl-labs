# frozen_string_literal: true

json.extract! calc, :id, :input_sequence, :output_sequences, :created_at,
              :updated_at
json.url calc_url(calc, format: :json)
