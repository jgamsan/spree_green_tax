Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :tire_green_rates
  end
end
