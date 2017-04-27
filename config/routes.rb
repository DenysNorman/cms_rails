Rails.application.routes.draw do
  resources :pages
  get 'pages/block/new', to: 'pages#new_block', as: 'new_block'
  get 'pages/block/title/', to: 'pages#new_title_block', as: 'new_title_block'
  post 'pages/block/description', to: 'pages#new_description_block', as: 'new_description_block'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
