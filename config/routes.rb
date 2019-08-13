Rails.application.routes.draw do
  resources :clips
  resources :projects do
    member do
      get 'clips'
      put 'add_clip'
      put 'remove_clip'
    end
  end
  resources :authentication, only: [] do
    collection do
      post 'login'
      post 'signup'
    end
  end

  resources :audio_files, only: [:index, :show, :new, :create, :update] do
    member do
      post :trim
    end
  end

  resources :comments
  resources :users

  resources :forms do
    collection do
      get :audio_files
    end
  end
end
