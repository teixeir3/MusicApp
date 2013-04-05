MusicApp::Application.routes.draw do
  resources :albums
  resources :bands

  root :to => "bands#index"
end
