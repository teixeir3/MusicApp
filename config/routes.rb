Musicapp::Application.routes.draw do
  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :show]

  shallow do
    resources :bands do
      resources :albums do
        resources :tracks
      end
    end
  end

  ###
  # Note that,
  ###
  # shallow do
  #   resources :albums do
  #     resources :tracks
  #   end
  # end
  ###
  # is the same as:
  ###
  # resources :albums do
  #   resources :tracks, only: [:new, :create, :index]
  # end
  # resources :tracks, only: [:show, :edit, :update, :destroy]
  ###
end
