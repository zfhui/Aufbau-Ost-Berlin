Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup' unless Rails.env.development?

  mount ContentfulRails::Engine, at: '/contentful'

  if ENV['HEROKUAPP_URL'].present? && ENV['PUBLIC_URL'].present?
    constraints(host: /#{ENV['HEROKUAPP_URL']}/) do
      match "/(*path)", to: redirect { |params, req| "//#{ENV['PUBLIC_URL']}/#{params[:path]}" }, via: [:get, :post]
    end
  end

  root to: 'home#index'

  get 'about',     to: 'home#about'
  get 'impressum', to: 'home#impressum'
  get 'haftung',   to: 'home#haftung'

  get 'tags/:tag', to: 'photos#index', as: :tag

  resources :photos do
    collection { post :import}
  end

  resources :buildings, only: [:index, :show]

  resources :index_cards do
    collection { post :import}
  end

  resources :tours, only: [:index, :show]
  get 'literatures', to: 'literatures#index'
end
