Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/farms', to: 'farms#index'
  get '/farms/new', to: 'farms#new'
  get '/farms/:id', to: 'farms#show'

  get '/farmers', to: 'farmers#index'
  get '/farmers/:id', to: 'farmers#show'

  get '/animals', to: 'animals#index'
  get 'animals/:id', to:'animals#show'

  get '/chores', to: 'chores#index'
  get '/chores/:id', to: 'chores#show'

  get '/farms/:id/animals', to: 'farm_animals#index'

  get '/farmers/:id/chores', to: 'farmer_chores#index'
end
