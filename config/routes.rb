Rails.application.routes.draw do
  devise_for :users

  resources :portfolios, except: %i[show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'portfolios/angular'

  get 'portfolios/ruby_on_rails'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do
    member { get :toggle_status }
  end

  root to: 'pages#home'
end
