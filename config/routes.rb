Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/farms', to: 'farms#index'
  get '/farms/new', to: 'farms#new'
  get '/farms/:id', to: 'farms#show'
  post '/farms', to: 'farms#create'
  get '/farms/:id/edit', to: 'farms#edit'
  patch '/farms/:id', to: 'farms#update'

  get '/farmers', to: 'farmers#index'
  get '/farmers/new', to: 'farmers#new'
  get '/farmers/:id', to: 'farmers#show'
  post '/farmers', to: 'farmers#create'
  get '/farmers/:id/edit', to: 'farmers#edit'
  patch '/farmers/:id', to: 'farmers#update'

  get '/animals', to: 'animals#index'
  get 'animals/:id', to:'animals#show'

  get '/chores', to: 'chores#index'
  get '/chores/:id', to: 'chores#show'

  get '/farms/:id/animals', to: 'farm_animals#index'
  get '/farms/:id/animals/new', to: 'farm_animals#new'
  post '/farms/:id/animals', to: 'farm_animals#create'

  get '/farmers/:id/chores', to: 'farmer_chores#index'
end
