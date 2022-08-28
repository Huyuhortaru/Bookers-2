Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to:'homes#top'
  
  resources :users,only:[:show,:edit]
  
  # get '/top' => 'homes#top'
  
end
