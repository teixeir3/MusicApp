MusicApp::Application.routes.draw do
  resources :albums do
    resources :tracks, :only => [:new]
  end
  resources :bands do
    resources :albums, :only => [:new]
  end
  resources :tracks

  root :to => "bands#index"
end
