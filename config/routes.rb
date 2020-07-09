Rails.application.routes.draw do
  get 'search',to:'evnts#search'
  get 'event',to:'evnts#event'
  post 'event',to:'evnts#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'home',to: 'static_pages#home'
  root 'static_pages#home'
  get 'register',to: 'users#register'
  get 'htmlQuiz',to: 'static_pages#htmlQuiz'
  get 'gkQuiz',to: 'static_pages#gkQuiz'
  get 'mathQuiz',to: 'static_pages#mathQuiz'
  get 'englishQuiz',to: 'static_pages#englishQuiz'
  resources :users
  resources :events
end
