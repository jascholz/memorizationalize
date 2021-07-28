Rails.application.routes.draw do
  devise_for :users, skip: :all
  root to: 'home#show'

  resource :home, only: :show

  resources :drawers, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :invitation
    end

    member do
      patch :invite_code
    end
  end

  resources :attachments, only: [:create, :update, :show, :edit, :destroy]
  resources :bookmarks, only: [:create, :update, :show, :edit, :destroy]
  resources :events, only: [:create, :update, :new, :edit, :show]
  resources :ideas, only: [:create, :update, :show]
  resources :images, only: [:create, :update, :show]
  resources :notes, only: [:create, :update, :show, :edit, :destroy]
  resources :todos, only: [:create, :update, :show, :index]

  # resources :categories, only: [:index, :create, :update]

  resources :galleries, only: [] do
    post :show_all
  end

  resources :users do
    collection do
      resources :sessions, only: [:new, :create], controller: 'users/sessions' do
        collection do
          delete :destroy
        end
      end
    end
    resources :category_mappings, only: :update, controller: 'users/category_mappings'
  end

  resources :admin, only: :index

  resource :feg, only: :show, controller: 'feg' do
    get 'about_us'
    get 'our_believes'
    get 'news'
    get 'program'
    get 'not_found'

    resources :preaches, controller: 'feg/preaches'
  end
end
