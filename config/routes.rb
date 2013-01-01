Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :tire_green_rates
    resources :products do
      member do
        get 'tires_info'
      end
    end
  end
end
