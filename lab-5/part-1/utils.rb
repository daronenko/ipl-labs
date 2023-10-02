# frozen_string_literal: true

def f(param_a, param_b)
  a = param_a.to_f
  b = param_b.to_f
  (Math.sin(a) - b) / (b.abs + Math.cos(b**2))
end
