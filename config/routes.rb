Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, except: [ :index, :destroy ] do
    resources :pets, shallow: true do
      resources :appointments, shallow: true
    end
  end

  resources :service_categories, except: [ :destroy ] do
    resources :services, shallow: true
  end
end
