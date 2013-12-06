DealerLocator::Application.routes.draw do
  resources :searches


  resources :locations
  root :to => 'searches#new'

end
