Yahoo::Application.routes.draw do
  resources :user
  match '/place' =>  'place#update',  :via => 'put'
  resources :place, :except => :update
  root :to => 'visitors#new'
end
