Rails.application.routes.draw do
  get 'search',to: 'events#search'
  post 'event',to: 'events#event'
  get 'event',to: 'events#event'
  get 'home',to: 'static_pages#home'
  root 'static_pages#home'
  get 'register',to: 'users#register'
  get 'htmlQuiz',to: 'static_pages#htmlQuiz'
  get 'gkQuiz',to: 'static_pages#gkQuiz'
  get 'mathQuiz',to: 'static_pages#mathQuiz'
  get 'englishQuiz',to: 'static_pages#englishQuiz'
  resources :users
  resources :event_to_uses
end
