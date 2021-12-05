Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/farms', to: 'farms#index'
  get '/farms/new', to: 'farms#new'
  get '/farms/:id', to: 'farms#show'
  post '/farms', to: 'farms#create'
  get '/farms/:id/edit', to: 'farms#edit'
  patch '/farms/:id', to: 'farms#update'
  delete '/farms/:id/destroy', to: 'farms#destroy'

  get '/farmers', to: 'farmers#index'
  get '/farmers/new', to: 'farmers#new'
  get '/farmers/:id', to: 'farmers#show'
  post '/farmers', to: 'farmers#create'
  get '/farmers/:id/edit', to: 'farmers#edit'
  patch '/farmers/:id', to: 'farmers#update'

  get '/animals', to: 'animals#index'
  get '/animals/:id', to:'animals#show'
  get '/animals/:id/edit', to: 'animals#edit'
  patch '/animals/:id', to: 'animals#update'
  delete '/animals/:id/destroy', to: 'animals#destroy'

  get '/chores', to: 'chores#index'
  get '/chores/:id', to: 'chores#show'
  get '/chores/:id/edit', to:'chores#edit'
  patch '/chores/:id', to: 'chores#update'

  get '/farms/:id/animals', to: 'farm_animals#index'
  get '/farms/:id/animals/new', to: 'farm_animals#new'
  post '/farms/:id/animals', to: 'farm_animals#create'

  get '/farmers/:id/chores', to: 'farmer_chores#index'
  get '/farmers/:id/chores/new', to: 'farmer_chores#new'
  post '/farmers/:id/chores', to: 'farmer_chores#create'
end
