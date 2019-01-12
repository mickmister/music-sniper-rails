Rails.application.routes.draw do
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
