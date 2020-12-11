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

  resource :united, only: [] do
    resources :meetings, controller: 'united/meetings'
    resources :games, only: [:index, :show, :edit, :update], controller: 'united/games'
    resources :slots, controller: 'united/slots'
    resources :users, only: [:update], controller: 'united/users'
  end
  get '/united', to: 'united/meetings#index'

  namespace :united do
    resources :users, only: [:new, :create]
    resource :votes, only: [] do
      get :vote
    end
  end
end
