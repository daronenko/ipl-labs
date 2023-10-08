# frozen_string_literal: true

EPS = 1e-2

def block_f1(val)
  Math.cos(val)
end

def block_f2(val)
  Math.sin(val**2)
end

def neibr(x_val, y_val, &func)
  (y_val - func.call(x_val)).abs <= EPS
end
