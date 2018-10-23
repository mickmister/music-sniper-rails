Rails.application.routes.draw do
  resources :audio_files, only: [:index, :show, :new, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :forms do
    collection do
      get :audio_files
    end
  end
end
