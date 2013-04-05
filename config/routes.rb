MusicApp::Application.routes.draw do
  resources :albums
  resources :bands
  resources :tracks

  root :to => "bands#index"
end
