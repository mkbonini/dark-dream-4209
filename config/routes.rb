Rails.application.routes.draw do
  get '/recipes', to: 'recipes#index'
end
