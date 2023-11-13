Rails.application.routes.draw do
  root 'index#input'
  get 'index/view'
end
