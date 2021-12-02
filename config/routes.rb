Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/farms', to: 'farms#index'
  get '/farms/:id', to: 'farms#show'

  get '/farmers', to: 'farmers#index'
  get '/farmers/:id', to: 'farmers#show'

  get '/animals', to: 'animals#index'
  get 'animals/:id', to:'animals#show'

  get '/chores', to: 'chores#index'
end
