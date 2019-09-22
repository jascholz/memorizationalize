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

  resources :events, only: [:create, :update, :new, :edit, :show]
  resources :notes, only: [:create, :update, :show, :edit, :destroy]
  resources :ideas, only: [:create, :update, :show]
  resources :images, only: [:create, :update, :show]
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
end
