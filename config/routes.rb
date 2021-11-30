Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/farms', to: 'farms#index'

  get '/farmers', to: 'farmers#index'
end
