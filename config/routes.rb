Rails.application.routes.draw do
  root 'videos#index'
  get 'videos/:id' => 'videos#show', as: 'video'

  get 'sessions/new' => 'sessions#new', as: 'login'
  post 'sessions'    => 'sessions#create'
  delete 'sessions'  => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
