Rails.application.routes.draw do
  resources :questions, :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
